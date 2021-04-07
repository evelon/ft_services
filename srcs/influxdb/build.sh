#!/bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f influxdb
docker build -t influxdb $BASEDIR