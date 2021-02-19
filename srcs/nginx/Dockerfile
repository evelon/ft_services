FROM alpine:3.13.1
LABEL maintainer "jolim <ezemango@gmail.com>"
RUN apk update && apk upgrade

# install nginx
EXPOSE 80 443
RUN apk add nginx

# set ssl
RUN apk add openssl
RUN openssl req -newkey rsa:2048 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out /etc/ssl/certs/nginx-selfsigned.crt \
			-keyout /etc/ssl/private/nginx-selfsigned.key \
			-subj "/C=KR/ST=Seoul/L=Seoul/O=42seoul/OU=ft_services/CN=localhost" && \
			chmod 600 /etc/ssl/certs/nginx-selfsigned.crt /etc/ssl/private/nginx-selfsigned.key
COPY ./nginx.conf ./etc/nginx/http.d/nginx_service.conf
COPY ./index.html ./var/www/html/
COPY ./fastcgi_params ./etc/nginx/fastcgi_params
RUN rm etc/nginx/http.d/default.conf
RUN mkdir /run/nginx
CMD ["nginx", "-g", "daemon off;"]