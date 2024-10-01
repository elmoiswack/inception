FROM debian:bookworm

RUN apt update -y
RUN apt install -y php8.2 php8.2-common php8.2-fpm php8.2-mysql php8.2-cgi php8.2-gd php8.2-xml mariadb-client wget curl

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/configure.sh ./

WORKDIR /var/www/html

RUN useradd -ms /bin/bash wordpress
RUN mkdir -p /var/www/html
RUN chown -R wordpress /var/www/html

RUN echo "listen=9000" >> /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

USER wordpress

ENTRYPOINT [ "sh", "/configure.sh" ]

USER root

CMD [ "php-fpm8.2", "-F" ]