FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

# Create mysql directories and give correct ownership
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

# Copy config files
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /script.sh

# Initialise mariadb data directory
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Expose port 3306 to the docker network
EXPOSE 3306

# Run script
ENTRYPOINT ["./script.sh"]