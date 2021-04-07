#!/bin/bash
BASEDIR=$(dirname "$0")
docker image rm -f alpine:3.12_mirror
docker build -t alpine:3.12_mirror $BASEDIR