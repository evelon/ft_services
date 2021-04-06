#!/bin/bash
export MINIKUBE_HOME=/goinfre/$USER/
./srcs/minikube_setup.sh
eval $(minikube docker-env)
./srcs/metallb/metallb.sh

# build images
./srcs/mysql/build.sh
./srcs/phpmyadmin/build.sh
./srcs/wordpress/build.sh
./srcs/nginx/build.sh

kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml