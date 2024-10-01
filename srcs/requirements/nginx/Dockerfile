FROM debian:bookworm

RUN apt-get update -y
RUN apt-get install -y nginx openssl

WORKDIR /etc/nginx
COPY ./conf/wordpress.conf ./sites-enabled/wordpress.conf

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
				-out /etc/ssl/certs/dhussain.42.fr.crt \
				-keyout /etc/ssl/certs/dhussain.42.fr.key \
				-subj "/C=NL/ST=North-Holland/L=Amsterdam/O=Codam/OU=dhussain/CN=dhussain/"

RUN rm -rf /etc/nginx/sites-enabled/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]
