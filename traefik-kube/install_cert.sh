#!/bin/bash

CERT64=$(kubectl get secret --namespace=kube-system traefik-cert -o json | jq '.data."tls.crt"' | xargs echo) 

mkdir -p /etc/docker/certs.d/registry.kube\:30443
echo $CERT64 | base64 --decode > /etc/docker/certs.d/registry.kube\:30443/ca.crt
