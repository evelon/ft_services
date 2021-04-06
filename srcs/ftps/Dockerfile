FROM alpine:3.12
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# install openrc
RUN apk add openrc
RUN apk add vsftpd

# set vsftpd
COPY ./vsftpd.conf /etc/vsftpd/
RUN echo root > /etc/vsftpd/chroot_list

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]