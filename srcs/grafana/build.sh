#!/bin/bash
BASEDIR=$(dirname "$0")
sed -e "s/minikube_ip/$MINIKUBE_IP/" $BASEDIR/grafana.ini > $BASEDIR/grafana_copy.ini
docker image rm -f grafana
docker build -t grafana $BASEDIR