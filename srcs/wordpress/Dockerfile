FROM alpine:3.12
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# install openrc
RUN apk add openrc

# install nginx, wget, php-fpm and php-mbstring

RUN apk add nginx
RUN apk add wget
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session php7-ctype

# install wordpress

WORKDIR /tmp/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && \
		mv wordpress /var/www/html/ && \
		rm latest.tar.gz
COPY ./wp-config.php /var/www/html/wp-config.php
WORKDIR /

# copy nginx config files
COPY ./fastcgi_params /etc/nginx/fastcgi_params
COPY ./wp.conf /etc/nginx/conf.d/wordpress_service.conf

# prepare setup.sh
COPY ./setup.sh /tmp/setup.sh
RUN chmod -u+x /tmp/setup.sh
COPY ./healthcheck.sh /
RUN chmod -u+x ./healthcheck.sh

VOLUME ["/sys/fs/cgroup/"]

# expose a port
EXPOSE 5050

CMD ["./tmp/setup.sh"]