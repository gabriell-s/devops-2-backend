# 📚 devops-backend

This repository contains a Django application configured with [Poetry](https://python-poetry.org/), a modern tool for dependency management and virtual environments in Python.

---

## ⚙️ Prerequisites

Before you begin, make sure you have the following installed:

- [Python 3.10+](https://www.python.org/downloads/)
- [Poetry](https://python-poetry.org/docs/#installation)

---

## 🚀 How to Run the Project

### 1. Install Dependencies

```bash
poetry install
```

### 2. Apply Database Migrations

```bash
poetry run python manage.py migrate
```

### 3. (Optional) Create a Superuser to Access the Admin Panel

```bash
poetry run python manage.py createsuperuser
```

### 4. Start the Development Server

```bash
poetry run python manage.py runserver
```

Visit: [http://localhost:8080](http://localhost:8080)

---

## 📁 Project Structure

```bash
.
├── backend/             # Main Django project
├── backend/core/        # Core application
├── manage.py            # Django entry point
├── pyproject.toml       # Dependency config managed by Poetry
├── poetry.lock          # Lockfile with exact versions
```

---

## 📚 References

- [Django Documentation](https://docs.djangoproject.com/)
- [Poetry Documentation](https://python-poetry.org/docs/)

