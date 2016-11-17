#!/bin/bash

APISERVER=localhost:8080
TOKEN=$(kubectl describe secret $(kubectl get secrets | grep default | cut -f1 -d ' ') | grep -E '^token' | cut -f2 -d':' | tr -d '\t')
echo Api server: $APISERVER
echo Token:      $TOKEN

curl $APISERVER/api --header "Authorization: Bearer $TOKEN" --insecure

curl http://localhost:8001/ui
