FROM alpine:3.13.1
LABEL maintainer "jolim <ezemango@gmail.com>"
RUN apk update && apk upgrade

# expose a port
EXPOSE 5050

# install nginx, wget, php-fpm and php-mbstring
RUN apk add nginx
RUN apk add wget
RUN apk add php-fpm php-mbstring

# install phpMyAdmin
RUN mkdir -p /var/www/html/phpMyAdmin/
WORKDIR /tmp/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
		tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpMyAdmin && \
		rm phpMyAdmin-5.0.4-all-languages.tar.gz
COPY ./pma-config.php /var/www/html/phpMyAdmin/config.inc.php
WORKDIR /


RUN mkdir /var/www/html/phpMyAdmin/tmp && \
		chown -R nginx:nginx /var/www/html/phpMyAdmin && \
		chmod -R 775 /var/www/html/phpMyAdmin

# copy config file for nginx
COPY ./pma.conf /etc/nginx/http.d/phpmyadmin_service.conf
COPY ./fastcgi_params /etc/nginx/fastcgi_params

RUN mkdir /run/nginx
CMD ["nginx", "-g", "daemon off;"]