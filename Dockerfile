# Use a base Python image
FROM python:3.9-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Install system dependencies (optional, depending on your needs)
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     build-essential \
#     libpq-dev \
#     && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt and install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project code
COPY . /app/

# Collect static files (important for production)
RUN python manage.py collectstatic --noinput

# Expose the port where Gunicorn/uWSGI will run
EXPOSE 8000

# Command to run the Django application with a production-ready WSGI server like Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "your_project_name.wsgi:application"]