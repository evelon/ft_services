FROM alpine:3.12_mirror
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# install grafana
RUN	apk add grafana --repository=https://mirrors.ustc.edu.cn/alpine/latest-stable/community/

CMD ["/usr/sbin/grafana-server", "--homepath=/usr/share/grafana"]