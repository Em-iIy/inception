#!/bin/bash

# If the database doesn't already exist initialize the database and users
if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then
	echo "FLUSH PRIVILEGES;" > init.sql
	echo "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;" >> init.sql
	echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> init.sql
	echo "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" >> init.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" >> init.sql
	echo "FLUSH PRIVILEGES;" >> init.sql

	# cat init.sql

	# run mariadbd while giving init.sql as input to initialize the database
	mariadbd --bootstrap < init.sql
fi

# Run mariadbd
mariadbd