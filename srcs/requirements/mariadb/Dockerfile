FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

RUN apt-get install nano -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /script.sh

CMD ["./script.sh"]