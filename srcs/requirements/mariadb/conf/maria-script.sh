#!/bin/sh

#  if ! pgrep mariadbd > /dev/null; then
# 	service mariadb start
# 	sleep 5
# fi

echo "----- Setting MariaDB -----"

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql' &

mariadb -u root -e "
	CREATE DATABASE IF NOT EXISTS $MY_DB;
	CREATE USER IF NOT EXISTS '$MY_USER'@'%' IDENTIFIED BY '$MY_USER_PASS';
	GRANT ALL PRIVILEGES ON $MY_DB.* TO '$MY_USER'@'%';
	FLUSH PRIVILEGES;
	"

#mysqladmin -u root -p$MY_ROOT_PASS shutdown
mariadb -u root -p -e "SHOW DATABASES;"

wait