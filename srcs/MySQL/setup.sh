#!/bin/bash
docker image rm -f alpine_ft:mysql
docker build -t alpine_ft:mysql $(dirname "$0")