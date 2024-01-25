DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all: up
.PHONY: all

up:
	docker compose -f $(DOCKER_COMPOSE_FILE) up
.PHONY: up

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down
.PHONY: down

start:
	docker compose -f $(DOCKER_COMPOSE_FILE) start
.PHONY: start

stop:
	docker compose -f $(DOCKER_COMPOSE_FILE) stop
.PHONY: stop

	# docker compose up $(DOCKER_COMPOSE_FILE) --force-recreate --build
re: down
	docker compose -f $(DOCKER_COMPOSE_FILE) up --force-recreate --build
	docker image prune -f
.PHONY: re