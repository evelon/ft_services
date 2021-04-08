#!/bin/bash
export MINIKUBE_HOME=/goinfre/$USER/
./srcs/minikube_setup.sh
eval $(minikube -p minikube docker-env)
export MINIKUBE_IP=$(minikube ip)
./srcs/metallb/metallb.sh

# build images
./srcs/base_image/build.sh
./srcs/mysql/build.sh
./srcs/phpmyadmin/build.sh
./srcs/wordpress/build.sh
./srcs/nginx/build.sh
./srcs/ftps/build.sh
./srcs/telegraf/build.sh
./srcs/influxdb/build.sh
./srcs/grafana/build.sh

kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/telegraf/telegraf.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml

minikube dashboard