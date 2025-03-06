FROM debian:12

RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=mde-avel.42.fr"
    
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/wordpress.conf /etc/nginx/conf.d/wordpress.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]