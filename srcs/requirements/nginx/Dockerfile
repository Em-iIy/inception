# to build and run:
# sudo docker build ./srcs/requirements/nginx/ -t nginx:1.0 && sudo docker run -p 443:443 -it nginx:1.0

FROM debian:bullseye

# Install required packages
RUN apt-get update -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

# Install utils
RUN apt-get install nano -y
RUN apt-get install curl -y

# Setup TLS
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=gwinnink.42.fr"

# Setup Nginx
# RUN mkdir -p /var/run/nginx
# COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled/*
COPY conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# Setup wordpress
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Expose 443 to the docker network (not needed?)
EXPOSE 443

# Run nginx
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

