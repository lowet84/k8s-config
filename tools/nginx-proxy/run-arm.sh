#!/bin/bash
docker rm -f nginx-kube-proxy-arm
#sh build.sh
docker run -d -it --restart always --name nginx-kube-proxy-arm --net=host lowet84/nginx-kube-proxy-arm
