#!/bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f telegraf
docker build -t telegraf $BASEDIR