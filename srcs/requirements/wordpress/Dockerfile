FROM debian:bullseye


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl php php7.4-fpm php-mysql mariadb-client netcat

# copy the wordpress configuration script to the root directory in the container
COPY ./script/wp_script.sh /

# change the permission of the script to make it executable
RUN  chmod +x wp_script.sh

# define the entrypoint command to run when the container starts
ENTRYPOINT ["./wp_conf.sh"]