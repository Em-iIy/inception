FROM debian:bullseye

# Install required packages
RUN apt-get update -y
RUN apt-get install wget -y

# Install php
RUN apt-get install php7.4 php7.4-fpm php7.4-mysql mariadb-client -y
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf && echo "clear_env = no" >> /etc/php/7.4/fpm/pool.d/www.conf

# Install wordpress
RUN wget https://wordpress.org/wordpress-6.4.2.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.2.tar.gz && rm wordpress-6.4.2.tar.gz
RUN chown -R root:root /var/www/wordpress

# Install wp cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/

COPY ./conf/script.sh /script.sh
ENTRYPOINT ["./script.sh"]