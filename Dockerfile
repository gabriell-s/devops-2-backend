# Use a base Python image
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DATABASE_URL=${DATABASE_URL}

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
COPY ./static /app/static


# Collect static files (important for production)
RUN python manage.py collectstatic --noinput

# Expose the port where Gunicorn/uWSGI will run
EXPOSE 8080

# Command to run the Django application with a production-ready WSGI server like Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "your_project_name.wsgi:application"]