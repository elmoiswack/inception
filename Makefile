DATA=/home/dhussain/data

all: up

up: $(DATA)
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

$(DATA):
	mkdir -p $(DATA)/wordpress $(DATA)/mariadb

clean: down
	rm -rf $(DATA)
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af

re: clean all

.PHONY: up down clean fclean re