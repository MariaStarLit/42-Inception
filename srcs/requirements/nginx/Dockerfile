FROM debian:12

RUN apt-get update && apt-get install -y nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/wordpress.conf /etc/nginx/conf.d/wordpress.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]