FROM python:3.11-alpine

WORKDIR /app

# Instalar dependencias del sistema para psycopg2
RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000
CMD ["python", "app.py"]