#!/bin/bash

service mariadb start;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
echo "ALTER USER"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
echo "FLUSH"
mysql -e "FLUSH PRIVILEGES;"
echo "shutdown"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
echo "running mysqld_safe"
exec mysqld_safe
echo "done"