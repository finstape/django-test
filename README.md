![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white) ![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

# Restaurant Menu API

Project provides RESTful API for returning menu categories with foods.

## Run Locally

Clone the project

```bash
git clone https://github.com/finstape/django-test.git
```

Go to the project directory

```bash
cd django-test
```

Run docker compose

```bash
make up
```

## Swagger

```bash
http://127.0.0.1:8000/swagger
```

## Foods View

```bash
http://127.0.0.1:8000/api/v1/foods/
```

## Test data

Test data automatically generated on database initialization. You can find it in `/docker/fill_data.sql`.

## Make commands

```bash
make help     # Show all available commands with descriptions
make env      # Create .env file from .env.example
make install  # Install dependencies using Poetry
make up       # Build and start the project in Docker (detached mode)
make down     # Stop and remove Docker containers
make logs     # View and follow Docker container logs
make migrate  # Apply Django database migrations inside the container
make run      # Run Django development server locally
make lint     # Check code quality using Ruff
make format   # Automatically fix and reformat code with Ruff
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
