#!/bin/bash
openssl req -new -x509 -keyout tls.key -out tls.crt -days 365 -nodes
kubectl delete secret --namespace=kube-system traefik-cert
kubectl create secret generic traefik-cert \
        --from-file=tls.crt \
        --from-file=tls.key \
        --namespace=kube-system
kubectl delete configmap --namespace=kube-system traefik-conf
kubectl create configmap traefik-conf --from-file=traefik.toml --namespace=kube-system

rm tls.crt
rm tls.key
