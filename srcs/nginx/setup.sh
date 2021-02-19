#!bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f alpine_nginx:service
docker build -t alpine_nginx:service $BASEDIR