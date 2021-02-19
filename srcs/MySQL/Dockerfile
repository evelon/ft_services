FROM alpine:3.13.1
LABEL maintainer "jolim <ezemango@gmail.com>"
RUN apk update && apk upgrade

# install mariadb mariadb-client
RUN apk add mariadb mariadb-client
RUN mysql