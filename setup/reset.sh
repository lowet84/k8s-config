#!/bin/bash

kubeadm reset
systemctl start kubelet
kubeadm init --pod-network-cidr=10.244.0.0/16 --token="029fdf.9a2016d3ac853537" --api-external-dns-names="home.test"
kubectl apply -f flannel.yml
kubectl taint nodes --all dedicated-
