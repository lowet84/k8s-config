#!/bin/bash

/usr/libexec/kubernetes/kubelet-plugins/volume/exec/lizardfs attach $(cat attachOptions.json)
/usr/libexec/kubernetes/kubelet-plugins/volume/exec/lizardfs mount /mfs localhost:30421
ls /mfs
/usr/libexec/kubernetes/kubelet-plugins/volume/exec/lizardfs unmount /mfs
ls -la /mfs
