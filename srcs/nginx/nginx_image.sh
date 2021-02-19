#!bin/bash
docker image rm -f s_nginx:test
docker build -t s_nginx:test .