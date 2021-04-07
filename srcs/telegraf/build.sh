#!/bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f alpine:telegraf
docker build -t alpine:telegraf $BASEDIR