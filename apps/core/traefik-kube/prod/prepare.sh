#!/bin/bash

kubectl create configmap traefik-conf --from-file=traefik.toml --namespace=kube-system
kubectl create configmap traefik-public-conf --from-file=traefik-public.toml --namespace=kube-system
