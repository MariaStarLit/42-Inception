#!/bin/sh

echo "--- Wordpress Script ---"
php -v

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "--- Setting up WP ---"

cd /var/www/html

wp core download --allow-root

wp core config  --allow-root \
                --dbname=$MY_DB \
                --dbuser=$MY_USER \
                --dbpass=$MY_USER_PASS \
                --dbhost=mariadb:3306

wp core install \
    --skip-email \
    --url=https://globex.turnipjuice.media \
    --title='Globex Corporation' \
    --admin_user=abe \
    --admin_email=abe@turnipjuice.media \
    --admin_password='password' \
    --allow-root

# Fix permissions to prevent 403 Forbidden
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# listen port to 9000
sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf
service php8.2-fpm restart

echo "🚀 WordPress container is running..."
tail -f /dev/null
