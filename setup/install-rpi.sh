#!/bin/bash

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt-get update && apt-get install -y kubelet=1.5.2-00 kubectl=1.5.2-00
dpkg -i kubeadm_1.6.0-alpha.0-2074-a092d8e0f95f52-00_armhf.deb
