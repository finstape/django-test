FROM python:3.12-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libpq-dev postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install --upgrade setuptools
RUN pip install poetry --no-cache-dir

COPY pyproject.toml poetry.lock /app/

RUN poetry config virtualenvs.create false && poetry install

COPY . .
COPY .env.example .env

EXPOSE 8000

CMD ["bash", "-lc", "poetry run python manage.py migrate && PGPASSWORD=\"$POSTGRES_PASSWORD\" psql -v ON_ERROR_STOP=1 --username \"$POSTGRES_USER\" --dbname \"$POSTGRES_DB\" --host \"$POSTGRES_HOST\" < /app/docker/fill_data.sql && poetry run gunicorn src.core.wsgi:application --bind 0.0.0.0:8000 --workers 2 --threads 4"]

