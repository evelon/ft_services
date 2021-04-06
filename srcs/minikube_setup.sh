#!/bin/bash

minikube start --driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)

# build images