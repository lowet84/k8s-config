#!/bin/bash
TOKEN="029fdf.9a2016d3ac853537"
URL="home.test"
kubeadm reset
systemctl start kubelet
kubeadm init --pod-network-cidr=10.244.0.0/16 --token=$TOKEN --api-external-dns-names=$URL
kubectl apply -f flannel.yml
kubectl taint nodes --all dedicated-
echo "kubeadm join --token=$TOKEN $URL" > join.sh
