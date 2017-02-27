#!/bin/bash

KEY64=$(kubectl get secret --namespace=kube-system traefik-cert -o json | jq '.data."tls.key"' | xargs echo)
CERT64=$(kubectl get secret --namespace=kube-system traefik-cert -o json | jq '.data."tls.crt"' | xargs echo)

echo $CERT64 | base64 --decode > registry.crt
echo $KEY64 | base64 --decode > registry.key
kubectl create secret generic ci-cert \
        --from-file=registry.key \
        --from-file=registry.crt \
        --namespace=ci
rm registry.key
rm registry.crt
