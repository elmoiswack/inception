DATA=/home/dhussain/data

all: up

up: build
	docker compose -f ./srcs/docker-compose.yml $@

down:
	docker compose -f ./srcs/docker-compose.yml $@

build: $(DATA)
	docker compose -f ./srcs/docker-compose.yml $@

$(DATA):
	mkdir -p $(DATA)/wordpress $(DATA)/mariadb

clean: down
	rm -rf $(DATA)
	docker compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af

re: clean all

.PHONY: up down build clean fclean re