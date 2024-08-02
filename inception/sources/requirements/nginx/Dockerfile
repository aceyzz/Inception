# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cedmulle <42-xvi@protonmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/27 11:33:36 by cedmulle          #+#    #+#              #
#    Updated: 2024/03/27 15:25:57 by cedmulle         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# on joue la securite
FROM debian:buster

# mise a jour paquets + install nginx et vim
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y vim

# creation cerificat ssl
RUN mkdir -p /etc/nginx/ssl
Run apt-get install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=cedmulle.42.fr/UID=cedmulle/emailAdress=cedmulle@student.42lausanne.ch"

# copie de la configuration nginx
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/wordpress

# modif permissions
RUN chmod -R 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# copie config et script de demarrage
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/start_nginx.sh /usr/local/start_nginx.sh
RUN chmod +x /usr/local/start_nginx.sh

# port
EXPOSE 443

# lets fucking go
ENTRYPOINT ["sh", "/usr/local/start_nginx.sh"]
