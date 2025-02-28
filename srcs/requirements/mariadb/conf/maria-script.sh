#!/bin/sh
echo "----- Setting MariaDB -----"

 if ! pgrep mariadbd > /dev/null; then
	service mariadb start
	sleep 5

fi

mariadb -u root -e "
	CREATE DATABASE IF NOT EXISTS $MY_DB;
	CREATE USER IF NOT EXISTS '$MY_USER'@'%' IDENTIFIED BY '$MY_USER_PASS';
	GRANT ALL PRIVILEGES ON $MY_DB.* TO '$MY_USER'@'%';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MY_ROOT_PASS';
	FLUSH PRIVILEGES;
	"

mariadb -u root -p -e "SHOW DATABASES;"

# mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'