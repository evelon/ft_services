#!/bin/bash
docker image rm -f mysql
docker build -t mysql $(dirname "$0")