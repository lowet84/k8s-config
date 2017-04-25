#!/bin/bash
if [ ! -z "$1" ]; then
  TOKEN=$1
else
  FIRST=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 6 | head -n 1)
  SECOND=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 16 | head -n 1)
  TOKEN=$FIRST.$SECOND
fi
kubeadm reset
kubeadm init --token=$TOKEN --use-kubernetes-version="v1.5.2"
#--pod-network-cidr 10.244.0.0/16

mkdir -p ~/.kube
cp /etc/kubernetes/admin.conf ~/.kube/config

#curl -sSL https://rawgit.com/coreos/flannel/v0.7.1/Documentation/kube-flannel.yml | sed "s/amd64/arm/g" | kubectl create -f -
#kubectl apply -f flannel-arm.yml
kubectl apply -f weave-arm.yml
echo "writing file join.txt"
echo "kubeadm join --token=$TOKEN" > /root/join.txt
