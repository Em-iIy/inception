#!/bin/bash

# Wait for database to finish configuration
sleep 5


if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	cd '/var/www/wordpress'

	echo "create config"
	wp config create --allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306

	echo "core install"
	wp core install --allow-root \
					--skip-email \
					--title="inception" \
					--admin_name=$WP_ADMIN \
					--admin_password=$WP_ADMIN_PW \
					--admin_email=$WP_ADMIN_EMAIL \
					--url=$DOMAIN_NAME

	echo "create user"
	wp user create \
					$WP_USER \
					$WP_USER_EMAIL \
					--allow-root \
					--user_pass=$WP_USER_PW \
					--role='author'

fi

echo "running fpm"
/usr/sbin/php-fpm7.4 -F