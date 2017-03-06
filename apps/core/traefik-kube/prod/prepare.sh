#!/bin/bash

kubectl create configmap traefik-conf --from-file=traefik.toml --namespace=kube-system
