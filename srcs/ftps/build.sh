#!/bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f ftps
docker build -t ftps $BASEDIR