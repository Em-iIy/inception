VOL_WORDPRESS = /home/Emily/data/wordpress
VOL_MARIADB = /home/Emily/data/mariadb

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all: up
.PHONY: all

up: $(VOL_WORDPRESS) $(VOL_MARIADB)
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

$(VOL_WORDPRESS):
	mkdir -p $@

$(VOL_MARIADB):
	mkdir -p $@

clean:
	rm -rf $(VOL_MARIADB)
	rm -rf $(VOL_WORDPRESS)
	docker rmi nginx:1.0 wordpress:1.0 mariadb:1.0
.PHONY: clean

re: clean up
.PHONY: re

nginx:
	sudo docker build ./srcs/requirements/nginx/ -t nginx:1.0 && sudo docker run --env-file=./srcs/.env -p 443:443 --rm -it nginx:1.0
mariadb:
	sudo docker build ./srcs/requirements/mariadb/ -t mariadb:1.0 && sudo docker run --env-file=./srcs/.env --rm -it mariadb:1.0
wordpress:
	sudo docker build ./srcs/requirements/wordpress/ -t wordpress:1.0 && sudo docker run --env-file=./srcs/.env --rm -it wordpress:1.0