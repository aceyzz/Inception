# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cedmulle <42-xvi@protonmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/27 14:45:49 by cedmulle          #+#    #+#              #
#    Updated: 2024/03/27 18:06:05 by cedmulle         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 				= inception
PATH_DOCKER_COMPOSE	= sources/docker-compose.yml
PATH_VOL_WORDPRESS	= /home/xvi/data/wordpress
PATH_VOL_MARIADB	= /home/xvi/data/mariadb
PATH_ENV_FILE		= /home/xvi/Desktop/.hidden/.env

# colors
RST = \033[0m
GRE	= \033[0;32m
RED	= \033[0;31m
YEL	= \033[0;33m
BLU = \033[0;34m
MAG = \033[0;35m
CYA = \033[0;36m

all: prepare down build run

run:
	@echo "$(GRE)Running the containers...$(RST)"
	docker compose -f $(PATH_DOCKER_COMPOSE) -p $(NAME) up

run-daemon:
	@echo "$(GRE)Running the containers in daemon mode...$(RST)"
	docker compose -f $(PATH_DOCKER_COMPOSE) -p $(NAME) up -d

down:
	@echo "$(RED)Downing the containers...$(RST)"
	docker compose -f $(PATH_DOCKER_COMPOSE) -p $(NAME) down

stop:
	@echo "$(RED)Stopping the containers...$(RST)"
	docker compose -f $(PATH_DOCKER_COMPOSE) -p $(NAME) stop

prepare:
	@if [ ! -d sources/.env ]; then cp ${PATH_ENV_FILE} sources/.env; fi
	@if [ ! -d ${PATH_VOL_WORDPRESS} ]; then echo "$(YEL)Creating WordPress volume directory...$(RST)"; mkdir -p ${PATH_VOL_WORDPRESS}; fi
	@if [ ! -d ${PATH_VOL_MARIADB} ]; then echo "$(YEL)Creating MariaDB volume directory...$(RST)"; \mkdir -p ${PATH_VOL_MARIADB}; fi


build:
	@echo "$(GRE)Building the containers...$(RST)"
	docker compose -f $(PATH_DOCKER_COMPOSE) -p $(NAME) build

clean:
	@echo "$(RED)Cleaning the containers...$(RST)"
	@rm -rf sources/.env
	docker system prune -a -f

fclean: clean
	@echo "$(RED)Deep cleaning the containers...$(RST)"
	docker system prune -a --volumes -f
	@echo "$(RED)Removing the volumes...$(RST)"
	@VOLUMES=$$(docker volume ls --quiet); if [ -n "$$VOLUMES" ]; then docker volume rm $$VOLUMES || true; else echo "No volumes to remove."; fi
	@rm -rf ${PATH_VOL_WORDPRESS}
	@rm -rf ${PATH_VOL_MARIADB}

re: fclean all

delete-volumes:
	@echo "$(RED)Removing the volumes...$(RST)"
	docker system prune -a --volumes -f
	@VOLUMES=$$(docker volume ls --quiet); if [ -n "$$VOLUMES" ]; then docker volume rm $$VOLUMES || true; else echo "No volumes to remove."; fi

delete-networks:
	@echo "$(RED)Removing the networks...$(RST)"
	docker network prune -f

status:
	@echo "\n$(GRE)Running containers:$(RST)"
	@docker compose -f $(PATH_DOCKER_COMPOSE) -p $(NAME) ps
	@echo ""
	
	@echo "$(GRE)Containers:$(RST)"
	@docker ps -a
	@echo ""
	
	@echo "$(GRE)Volumes:$(RST)"
	@docker volume ls
	@echo ""
	
	@echo "$(GRE)Images:$(RST)"
	@docker images
	@echo ""
	
	@echo "$(GRE)Networks:$(RST)"
	@docker network ls
	@echo ""