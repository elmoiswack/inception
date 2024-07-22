FROM debian:bullseye

RUN apt update && apt upgrade 
RUN apt install -y php-fpm


CMD [ "php-fpm8.2", "-F" ]