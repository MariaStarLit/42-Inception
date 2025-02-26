FROM debian:12

RUN apt-get -y update && apt-get upgrade -y
RUN apt-get install -y mariadb-client

RUN apt install -y \ 
curl \
php \
php-fpm \
php-json \
php-mysql \
php-curl \
php-dom \
php-exif \
php-fileinfo \
php-igbinary \
php-imagick \
php-intl \
php-mbstring \
php-xml \
php-zip

COPY ./conf/wordpess-script.sh /wordpess-script.sh
RUN chmod +x /wordpess-script.sh

ENTRYPOINT ["./wordpess-script.sh"]

# ENTRYPOINT ["/bin/bash"]