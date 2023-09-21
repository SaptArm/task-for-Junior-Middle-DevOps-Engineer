#Задаем базовый образ
FROM python:3.9-alpine

# Устанавливаем необходимые зависимости
RUN pip install flask gunicorn

# Копируем файл с настройками приложения
COPY app.py .

# Задаем переменные окружения
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Запускаем сервер приложений Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app"]