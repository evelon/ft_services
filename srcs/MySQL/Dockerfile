FROM alpine:3.13.1
LABEL maintainer "jolim <ezemango@gmail.com>"
RUN apk update && apk upgrade

# install mariadb mariadb-client openrc
RUN apk add mariadb mariadb-client openrc

# config file for mariadb

RUN mkdir -p /run/mysqld && mariadb-install-db --user=root --datadir=/var/lib/mysql
COPY ./my.cnf /etc/my.cnf

# initialize for phpmyadmin
COPY ./create_tables.sql /tmp/
COPY ./setup.sh /tmp/
RUN chmod 775 /tmp/setup.sh

VOLUME ["/sys/fs/cgroup/"]

# initialize openrc
RUN mkdir /run/openrc && touch /run/openrc/softlevel

EXPOSE 3306

CMD ["./tmp/setup.sh"]
