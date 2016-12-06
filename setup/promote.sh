#!/bin/bash
if [ "$1" -ne "yes" ]; then
  echo "Syntax is 'sh promote.sh yes'"
  exit 0
fi

kubeadm reset
systemctl start kubelet
kubeadm init --pod-network-cidr=10.244.0.0/16 --token=$TOKEN --api-external-dns-names=$URL
systemctl stop kubelet
rm -r /var/lib/etcd-old
mv /var/lib/etcd /var/lib/etcd-old
tar -xvf /var/lib/etcd-backup/etcd.tar.gz
mv backup /var/lib/etcd
systemctl start kubelet
#kubectl apply -f flannel.yml