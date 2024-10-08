# Используем официальный Python образ в качестве базового
FROM python:3.9-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл requirements.txt в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь проект в контейнер
COPY . .

# Открываем порт 8000 для общения контейнера с внешним миром
EXPOSE 8000

# Определяем команду для запуска приложения
CMD ["gunicorn", "-b", "0.0.0.0:8000", "-k", "eventlet", "app:app"]