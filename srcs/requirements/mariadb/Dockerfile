FROM debian:bookworm

RUN apt update -y
RUN apt install -y mariadb-server

RUN mkdir -p /var/run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY --chown=root:root ./tools/configure.sh ./
RUN chmod +x ./configure.sh

EXPOSE 3306 

ENTRYPOINT [ "bash", "configure.sh" ]

CMD [ "mysqld", "--user=mysql", "--bind-address=0.0.0.0" ]