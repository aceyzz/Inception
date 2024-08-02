# echo "";
# echo "";
# echo "DEBUG DES ENVS DE MARIADB :";
# echo "MD_ROOT_PASS : $MD_ROOT_PASS";
# echo "MD_DATA_NAME : $MD_DATA_NAME";
# echo "MD_USER_NAME : $MD_USER_NAME";
# echo "MD_USER_PASS : $MD_USER_PASS";
# echo "";
# echo "";

echo "\033[0;38;2;255;0;255m###### MARIADB START ######\033[0m\n"

# Initialisation de la base de données
mysqld --initialize --user=mysql --datadir=/var/lib/mysql;

chown -R mysql:mysql /var/lib/mysql;
chown -R mysql:mysql /run/mysqld;

# Lancement de mariadb en arrière plan
mysqld --user=mysql --datadir=/var/lib/mysql &

# On met la valeur du pid dans une variable afin de pouvoir kill le process
# lorsque la configuration de mariadb sera terminé
pid=$!

# Attente de la fin de lancement de mariadb
sleep 10

# Configuration de la base de données
mysql -u root -p${MD_ROOT_PASS} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MD_ROOT_PASS}';"
mysql -u root -p${MD_ROOT_PASS} -e "CREATE DATABASE IF NOT EXISTS ${MD_DATA_NAME};"
mysql -u root -p${MD_ROOT_PASS} -e "CREATE USER IF NOT EXISTS '${MD_USER_NAME}' IDENTIFIED BY '${MD_USER_PASS}';"
mysql -u root -p${MD_ROOT_PASS} -e "GRANT ALL PRIVILEGES ON *.* TO '${MD_USER_NAME}';"
mysql -u root -p${MD_ROOT_PASS} -e "FLUSH PRIVILEGES;"

# Affichage des bases de données dans le terminal
echo "------------------\n"
mysql -u root -p${MD_ROOT_PASS} -e "SHOW DATABASES;"
echo "------------------\n"
mysql -u root -p${MD_ROOT_PASS} -e "SELECT User FROM mysql.user"
echo "------------------\n"

# Kill de mysqld
kill "$pid"

# Remplacement du processus shell par mysqld
exec mysqld --user=mysql --datadir=/var/lib/mysql
