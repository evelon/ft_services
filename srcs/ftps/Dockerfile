FROM alpine:3.12_mirror
LABEL maintainer "jolim <jolim@student.seoul42.kr>"
RUN apk update && apk upgrade

# install openrc
RUN apk add openrc
RUN apk add vsftpd

# set ssl
RUN apk add openssl
RUN openssl req -newkey rsa:2048 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out /etc/ssl/certs/vsftpd-selfsigned.crt \
			-keyout /etc/ssl/private/vsftpd-selfsigned.key \
			-subj "/C=KR/ST=Seoul/L=Seoul/O=42seoul/OU=ft_services/CN=localhost" && \
			chmod 600 /etc/ssl/certs/vsftpd-selfsigned.crt /etc/ssl/private/vsftpd-selfsigned.key

# set root
RUN echo root:root | chpasswd
RUN mkdir -p /srv/ftp
RUN chown root:root /srv/ftp

# set vsftpd
COPY ./vsftpd_copy.conf /etc/vsftpd/vsftpd.conf
COPY ./test_for_ftps /srv/ftp/test_for_ftps

EXPOSE 20 21 20020 20021 20022

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]