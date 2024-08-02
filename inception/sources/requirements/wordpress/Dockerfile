# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cedmulle <42-xvi@protonmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/27 12:37:33 by cedmulle          #+#    #+#              #
#    Updated: 2024/03/27 15:26:35 by cedmulle         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# update des paquets + install php wget etc
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y wget
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

# creation dossiers
RUN	mkdir -p /var/www/wordpress
RUN mkdir -p /run/php

# modifs permissions
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www

# copies des configs et du script
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/start_wordpress.sh /usr/local/start_wordpress.sh
RUN chmod +x /usr/local/start_wordpress.sh

# port
EXPOSE 9000

# lets fucking go
ENTRYPOINT ["sh", "/usr/local/start_wordpress.sh"]