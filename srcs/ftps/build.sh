#!/bin/bash
BASEDIR=$(dirname "$0")
sed -e "s/minikube_ip/$MINIKUBE_IP/" $BASEDIR/vsftpd.conf > $BASEDIR/vsftpd_copy.conf
docker image rm -f ftps
docker build -t ftps $BASEDIR