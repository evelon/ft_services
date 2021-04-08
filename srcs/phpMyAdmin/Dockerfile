FROM alpine:3.12_mirror
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# install openrc
RUN apk add openrc

# install nginx, wget, php-fpm and php-mbstring

RUN apk add nginx
RUN apk add wget
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session php7-ctype

# install phpMyAdmin
WORKDIR /tmp/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
		tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
		mv phpMyAdmin-5.0.4-all-languages phpmyadmin && \
		mv phpmyadmin /var/www/html/ && \
		rm phpMyAdmin-5.0.4-all-languages.tar.gz
COPY ./pma-config.php /var/www/html/config.inc.php
WORKDIR /

RUN mkdir /var/www/html/tmp && \
		chown -R nginx:nginx /var/www/html && \
		chmod -R 775 /var/www/html

# copy config file for nginx
COPY ./pma.conf /etc/nginx/conf.d/phpmyadmin_service.conf
COPY ./fastcgi_params /etc/nginx/fastcgi_params

# prepare setup.sh
COPY ./setup.sh /tmp/setup.sh
RUN chmod -u+x /tmp/setup.sh
COPY ./healthcheck.sh /
RUN chmod -u+x ./healthcheck.sh

VOLUME ["/sys/fs/cgroup/"]

# expose a port
EXPOSE 5000

CMD ["./tmp/setup.sh"];