#!/bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f phpmyadmin
docker build -t phpmyadmin $BASEDIR