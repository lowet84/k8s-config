#!/bin/bash

NODE=$1

kubectl taint nodes $NODE dedicated=reserve:NoSchedule
kubectl label nodes $NODE reserve=true
