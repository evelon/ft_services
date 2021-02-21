FROM alpine:3.13.1
LABEL maintainer "jolim <ezemango@gmail.com>"
RUN apk update && apk upgrade

# install mariadb mariadb-client
RUN apk add mariadb mariadb-client
RUN mkdir -p /run/mysqld && \
	mariadb-install-db --user=root --datadir=/var/lib/mysql
CMD ["mysqld", "--user=root"]
