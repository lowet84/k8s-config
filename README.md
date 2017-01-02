# K8S Config
Configuration for Kubernetes cluster on bare metal

Using NGINX proxy to redirect traffic from ports: 80 and 443 to traefik since NodePort cannot be set lower than 30000. Will hopefulle be able to fix this after KubeAdm is updates so that HostPort works.

The purpose of this project is to create a RaspberryPi cluster with 6+ nodes.
* 1 Master node with load balancer, kube master & lizardfs master
* 1 Reserve node with lizardfs shadow & restore utility
* 2 Basic nodes for applications
* 2 Storage nodes running lizardfs chunk servers
