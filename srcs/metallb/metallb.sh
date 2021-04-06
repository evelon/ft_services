#!/bin/bash
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml

export MINIKUBE_IP=$(minikube ip)

BASEDIR=$(dirname "$0")

rm $BASEDIR/metallb_copy.yaml
sed -e "s/minikube_ip/$MINIKUBE_IP-$MINIKUBE_IP/" $BASEDIR/metallb.yaml > $BASEDIR/metallb_copy.yaml
kubectl apply -f $BASEDIR/metallb_copy.yaml

# gotten from https://metallb.universe.tf/installation/