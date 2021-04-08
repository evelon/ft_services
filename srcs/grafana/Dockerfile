FROM alpine:3.12_mirror
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# install grafana
RUN	apk add grafana --repository=https://mirrors.ustc.edu.cn/alpine/v3.13/community/

# config grafana
COPY ./datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY ./grafana_copy.ini /etc/grafana.ini

# set dashboards
RUN mkdir -p /var/lib/grafana/dashboards
COPY ./dashboards /var/lib/grafana/dashboards/
COPY ./dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/

CMD ["/usr/sbin/grafana-server", "--config=/etc/grafana.ini", "--homepath=/usr/share/grafana"]