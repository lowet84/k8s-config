#!/bin/bash

wget -O - http://packages.lizardfs.com/lizardfs.key | apt-key add -
echo "deb http://packages.lizardfs.com/ubuntu/xenial xenial main" > /etc/apt/sources.list.d/lizardfs.list
echo "deb-src http://packages.lizardfs.com/ubuntu/xenial xenial main" >> /etc/apt/sources.list.d/lizardfs.list
apt-get update
apt-get install -y lizardfs-client jq
