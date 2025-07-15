#!/bin/bash
set -e

echo "📦 Coletando arquivos estáticos..."
python manage.py collectstatic --noinput

echo "🧩 Criando migrações..."
python manage.py makemigrations --noinput

echo "🚀 Aplicando migrações..."
python manage.py migrate --noinput

echo "🔥 Iniciando Gunicorn..."
exec gunicorn backend.wsgi:application --bind 0.0.0.0:8080
