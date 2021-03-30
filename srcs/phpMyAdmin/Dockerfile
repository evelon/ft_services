FROM alpine:3.13.1
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# expose a port
EXPOSE 5050

# install nginx, wget, php-fpm and php-mbstring
RUN apk add nginx
RUN apk add wget
RUN apk add php-fpm php-mbstring php-json php-ctype php-curl php-session php-mysqli

# install phpMyAdmin
WORKDIR /tmp/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
		tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.4-all-languages phpmyadmin && \
		mv phpmyadmin /var/www/html/ && \
		rm phpMyAdmin-5.0.4-all-languages.tar.gz
COPY ./pma-config.php /var/www/html/phpmyadmin/config.inc.php
WORKDIR /

RUN mkdir /var/www/html/phpmyadmin/tmp && \
		chown -R nginx:nginx /var/www/html && \
		chmod -R 775 /var/www/html

# copy config file for nginx
COPY ./pma.conf /etc/nginx/http.d/phpmyadmin_service.conf
COPY ./fastcgi_params /etc/nginx/fastcgi_params
COPY ./setup.sh /tmp/setup.sh
RUN chmod -u+x /tmp/setup.sh

# # # install openrc
# # RUN apk add openrc

# RUN mkdir -p /run/php-fpm7/ \
# 		mkdir -p /run/nginx/ \
# 		mkdir -p /run/openrc/
CMD ["php-fpm7", "-D", "&", "nginx", "-g", "daemon off;"];