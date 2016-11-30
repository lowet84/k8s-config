#!/bin/bash

mkdir -p /usr/libexec/kubernetes/kubelet-plugins/volume/exec/lowet84~lizardfs
cp lizardfs /usr/libexec/kubernetes/kubelet-plugins/volume/exec/lowet84~lizardfs/
chmod +x /usr/libexec/kubernetes/kubelet-plugins/volume/exec/lowet84~lizardfs/lizardfs
