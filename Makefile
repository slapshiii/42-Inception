# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/05 10:43:15 by user42            #+#    #+#              #
#    Updated: 2021/09/10 22:38:34 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := inception

LOGIN := phnguyen
LOGIN ?= $(shell echo $$USER)

all: $(NAME)

$(NAME): up

up: set_user
	@cd ./srcs && docker-compose build
	@cd ./srcs && docker-compose up -d

set_user:
	@sed 's/##user##/$(LOGIN)/g' ./srcs/requirements/mariadb/tools/dump-template.sql > ./srcs/requirements/mariadb/tools/dump.sql
	@sed 's/##user##/$(LOGIN)/g' ./srcs/.env.template > ./srcs/.env
	@sudo sh -c 'mkdir -p /home/$(LOGIN)/data/wp /home/$(LOGIN)/data/db /home/$(LOGIN)/data/adminer /home/$(LOGIN)/data/redis /home/$(LOGIN)/data/git /home/$(LOGIN)/data/git_key'
	@sudo sh -c 'cp ~/.ssh/id_rsa.pub /home/$(LOGIN)/data/git_key'
	@sudo sh -c 'mkdir /home/$(LOGIN)/data/git/inception.git; cd /home/$(LOGIN)/data/git/inception.git; git init --bare'
	@echo "add hostname"
	@sudo sh -c 'cp /etc/hosts /etc/hosts_old'
	@sudo sh -c 'echo "172.17.0.1 $(LOGIN).42.fr" >> /etc/hosts'

down:
	@-cd ./srcs && docker-compose down
	@-sudo sh -c 'mv /etc/hosts_old /etc/hosts'

clean: bonus_down down
	@-rm -f ./srcs/.env srcs/requirements/mariadb/tools/dump.sql

fclean: clean
	@-docker stop $(shell docker ps -qa)
	@-docker rm $(shell docker ps -qa)
	@-docker rmi -f $(shell docker images -qa)
	@-docker network rm $(shell docker network ls -q)
	@-docker volume rm $(shell docker volume ls -q)
	@-docker system prune -f
	@sudo rm -rf /home/$(LOGIN)/data

re: fclean all

.PHONY: all build up set_user down bonus_up bonus_down clean fclean re