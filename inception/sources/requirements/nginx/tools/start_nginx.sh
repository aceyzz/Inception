echo "\033[0;38;2;0;255;0m###### NGINX START ######\033[0m\n"
nginx -v
nginx -g 'daemon off;' # Demarre nginx en foreground peu importe la config