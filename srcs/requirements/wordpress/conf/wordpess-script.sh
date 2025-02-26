#!/bin/sh
echo " --- Wordpress Script"
php -v

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo " --- Setting up WP"

wp core download --allow-root
wp core config \
    --dbname=globex \
    --dbuser=globex \
    --dbpass='password' \
    --allow-root
wp core install \
    --skip-email \
    --url=https://globex.turnipjuice.media \
    --title='Globex Corporation' \
    --admin_user=abe \
    --admin_email=abe@turnipjuice.media \
    --admin_password='password' \
    --allow-root


