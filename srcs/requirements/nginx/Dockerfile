FROM debian:bullseye

# Install required packages
RUN apt-get update -y && \
	apt-get install nginx \
					openssl -y

# Setup TLS
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 \
				-nodes \
				-out /etc/nginx/ssl/inception.crt \
				-keyout /etc/nginx/ssl/inception.key \
				-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=gwinnink.42.fr"

# Setup Nginx
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Setup wordpress permissions
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Run nginx
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
