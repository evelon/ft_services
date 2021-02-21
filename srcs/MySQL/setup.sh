#!bin/bash
docker image rm -f alpine_mysql:service
docker build -t alpine_mysql:service $(dirname "$0")