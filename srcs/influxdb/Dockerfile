FROM alpine:3.12_mirror
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# install influxdb
RUN apk add influxdb

# influx config
COPY ./influxdb.conf /etc/

# expose a port
EXPOSE 8086

CMD ["/usr/sbin/influxd"]