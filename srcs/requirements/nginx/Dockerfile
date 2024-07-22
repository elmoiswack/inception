FROM debian:bullseye

#at start up, update and upgrade so i get the latest version of apt
RUN apt update && apt upgrade 

#i install nginx and openssl packages
RUN apt install -y nginx openssl

#i create a dir to store data for the openssl
RUN mkdir -p /etc/nginx/ssl

#generates a ssl certificates, they are public ssl keys to provide HTTP services
RUN openssl req \
		-x509 \
		-nodes \
		-out /etc/nginx/ssl/nginx.crt \
		-keyout /etc/nginx/ssl/nginx.key \
		-subj "/C=NL/ST=Noord_Holland/L=Amsterdam/O=Codam/OU=42/CN=dhussain.42.nl/UID=dhussain"

#copies my config file to /etc/nginx/ so that nginx uses my config file
COPY ./nginx.conf /etc/nginx/nginx.conf

# create the wordpress directory which
RUN mkdir -p /var/www/wordpress

#exposing the port number so other containers can connect to
EXPOSE 443

#starts nginx, -g makes sure that it runs in the foreground so i can see what it does
#daemon off means that the container doesn't exit after it starts running
CMD ["nginx", "-g", "daemon off;"]