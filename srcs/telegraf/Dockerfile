FROM alpine:3.12_mirror
LABEL maintainer "jolim <jolim@student.seoul42.kr>"

# install telegraf
WORKDIR /tmp/
RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.0-static_linux_amd64.tar.gz && \
	tar zxvf telegraf-1.14.0-static_linux_amd64.tar.gz && \
	mv telegraf/telegraf /usr/bin/ && \
	rm -rf *
WORKDIR /

# copy telegraf config
COPY ./telegraf.conf /etc/telegraf/

CMD ["/usr/bin/telegraf"]