#!/bin/bash
docker rm -f nginx-kube-proxy
#sh build.sh
docker run -d -it --restart always --name nginx-kube-proxy --net=host lowet84/nginx-kube-proxy
