#!/bin/bash
kubectl delete -f traefik.yml
kubectl create -f traefik.yml --validate=false
