FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY ./script/mariadb_script.sh /mdb-script.sh

RUN chmod +x /mdb-script.sh

ENTRYPOINT ["./mdb-script.sh"]