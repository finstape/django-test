ifeq ($(shell test -e '.env' && echo -n yes),yes)
	include .env
endif

ifndef APP_PORT
override APP_PORT = 8000
endif

ifndef APP_HOST
override APP_HOST = 127.0.0.1
endif

args := $(wordlist 2, 100, $(MAKECMDGOALS))
ifndef args
MESSAGE = "No such command (or you pass two or many targets). List of possible commands: make help"
else
MESSAGE = "Done"
endif

APPLICATION_NAME = app
CODE = src

HELP_FUN = \
	%help; while(<>){push@{$$help{$$2//'options'}},[$$1,$$3] \
	if/^([\w-_]+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/}; \
    print"$$_:\n", map"  $$_->[0]".(" "x(20-length($$_->[0])))."$$_->[1]\n",\
    @{$$help{$$_}},"\n" for keys %help; \

env:  ##@Environment Create .env file with variables
	@$(eval SHELL:=/bin/bash)
	@cp .env.example .env

help: ##@Help Show this help
	@echo -e "Usage: make [target] ...\n"
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

install: ##@Environment Install dependencies via poetry
	poetry install

up:  ##@Project Run app and database with docker compose
	docker compose up -d --build

down: ##@Project Stop docker compose
	docker compose down

logs: ##@Project Follow docker compose logs
	docker compose logs -f

migrate: ##@Database Apply Django migrations
	docker compose exec -T web poetry run python manage.py migrate

run:  ##@Application Run Django dev server locally (requires local postgres)
	poetry run python manage.py runserver $(APP_HOST):$(APP_PORT)

lint:  ##@Code Check code with ruff
	poetry run ruff check $(CODE)

format:  ##@Code Reformat code with isort, black and ruff
	poetry run ruff check --fix $(CODE)

%::
	@echo $(MESSAGE).

