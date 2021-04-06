#!/bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f mysql
docker build -t mysql $BASEDIR