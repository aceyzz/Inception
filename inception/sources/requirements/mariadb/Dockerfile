# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cedmulle <42-xvi@protonmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/27 12:22:10 by cedmulle          #+#    #+#              #
#    Updated: 2024/03/27 15:29:47 by cedmulle         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# install packages
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install mariadb-server procps -y
RUN apt-get install vim -y

# copie working dir
RUN mkdir -p /run/mysqld /var/lib/mysql

# copie config mysql + script
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/start_mariadb.sh /usr/local/start_mariadb.sh
RUN chmod +x /usr/local/start_mariadb.sh

# port
EXPOSE 3306

# lets fucking go
ENTRYPOINT [ "sh", "/usr/local/start_mariadb.sh" ]
