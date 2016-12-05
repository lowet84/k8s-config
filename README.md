# K8S Config
Configuration for Kubernetes cluster on bare metal

Using NGINX proxy to redirect traffic from ports: 80 and 443 to traefik since NodePort cannot be set lower than 30000. Will hopefulle be able to fix this after KubeAdm is updates so that HostPort works.
