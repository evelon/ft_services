FROM alpine:3.12_mirror
LABEL maintainer "jolim <jolim@student.seoul42.kr>"

# install telegraf
RUN apk add telegraf --repository=https://mirrors.ustc.edu.cn/alpine/v3.13/community/

# copy telegraf config
COPY ./telegraf.conf /etc/telegraf/

CMD ["/usr/bin/telegraf"]