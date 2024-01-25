FROM debian:bullseye

RUN apt-get update -y && apt-get install nginx -y

RUN apt-get install nano curl -y

RUN mkdir -p /var/run/nginx

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=gwinnink.42.fr"

RUN mkdir -p /data/www
COPY ./pages/index.html /data/www

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
