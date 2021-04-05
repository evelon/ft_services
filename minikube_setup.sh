#!/bin/bash
export MINIKUBE_HOME=/goinfre/$USER/
minikube start --driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)

# build images