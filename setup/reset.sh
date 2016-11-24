#!/bin/bash
if [ -z "$1" ]; then
  echo "Syntax is 'sh reset.sh <url of host>'"
  exit 0
fi
FIRST=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1)
SECOND=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)
TOKEN=$FIRST.$SECOND
URL=$1
kubeadm reset
systemctl start kubelet
kubeadm init --pod-network-cidr=10.244.0.0/16 --token=$TOKEN --api-external-dns-names=$URL
kubectl apply -f flannel.yml
#kubectl taint nodes --all dedicated-
echo "writing file join.sh"
echo "kubeadm join --token=$TOKEN $URL" > join.sh
