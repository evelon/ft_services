#!/bin/bash
minikube start
minikube addons enable metallb
eval $(minikube docker-env)

# build images