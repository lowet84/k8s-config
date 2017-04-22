#!/bin/bash
if [ ! -z "$1" ]; then
  TOKEN=$1
else
  FIRST=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 6 | head -n 1)
  SECOND=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 16 | head -n 1)
  TOKEN=$FIRST.$SECOND
fi
kubeadm reset
kubeadm init --token=$TOKEN 
#--pod-network-cidr 10.244.0.0/16

cp /etc/kubernetes/admin.conf ~/.kube/config

#kubectl apply -f flannel-arm.yml
kubectl apply -f weave-arm.yml
echo "writing file join.txt"
echo "kubeadm join --token=$TOKEN" > /root/join.txt
