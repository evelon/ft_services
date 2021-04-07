#!/bin/bash

minikube start --driver=virtualbox
minikube addons enable metallb

# build images