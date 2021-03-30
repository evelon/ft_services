#!/bin/sh

mkdir -p /run/nginx/
mkdir -p /run/openrc/
mkdir -p /run/php-fpm7/
touch /run/nginx/softlevel
touch /run/openrc/softlevel
touch /run/php-fpm7/softlevel

rc-update add nginx default
rc-update add php-fpm7 default
rc-status default
rc-service nginx start
rc-service php-fpm7 start

sh