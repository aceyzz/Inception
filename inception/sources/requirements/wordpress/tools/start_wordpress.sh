echo "\033[0;38;2;0;255;255m###### NGINX START ######\033[0m\n"

# php-fpm7.3 -v

# tentative de cnnexion a mariadb
while ! mariadb -u $MD_USER_NAME --password=$MD_USER_PASS -h mariadb -P 3306 --silent; do
	echo "\033[0;38;2;128;128;128mWaiting for MariaDB to start...\033[0m"
	sleep 1
done 

echo "\033[0;38;2;180;180;180mDATABASES:\033[0m\n"
mariadb -u $MD_USER_NAME --password=$MD_USER_PASS -h mariadb -P 3306 -e "SHOW DATABASES;"
echo "\n"

echo "\033[0;38;2;0;255;0mInstalling WordPress...\033[0m"

# Telecharge wordpress CLI
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Installation Wordpress
cd /var/www/wordpress
wp core download --allow-root

echo "\033[0;38;2;0;255;0mConfiguring WordPress...\033[0m"
# Configuration Wordpress
# Connexion database + creer Admin et User
wp config create --dbname="${MD_DATA_NAME}" --dbuser="${MD_USER_NAME}" --dbpass="${MD_USER_PASS}" --dbhost="${WP_HOST}" --allow-root
wp core install --url="${DOMAIN_NAME}" --title="${WP_NAME}" --admin_user="${WP_ADMN_NAME}" --admin_password="${WP_ADMN_PASS}" --admin_email="${WP_ADMN_MAIL}" --allow-root
wp user create $WP_USER_NAME $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASS --allow-root

# launch
php-fpm7.3 -F
