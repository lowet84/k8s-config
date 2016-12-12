#!/bin/bash

NODE=$1

kubectl taint nodes $NODE dedicated=storage:NoSchedule
kubectl label nodes $NODE role=storage
