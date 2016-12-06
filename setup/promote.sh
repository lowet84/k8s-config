#!/bin/bash
if [ "$1" != "yes" ]; then
  echo "Syntax is 'sh promote.sh yes'"
  exit 0
fi

kubeadm reset
systemctl start kubelet
kubeadm init --pod-network-cidr=10.244.0.0/16
systemctl stop kubelet
rm -r /var/lib/etcd-old
mv /var/lib/etcd /var/lib/etcd-old
tar -xvf /var/lib/etcd-backup/etcd.tar.gz
mkdir /var/lib/etcd
mv backup /var/lib/etcd/data
systemctl start kubelet
#kubectl apply -f flannel.yml
