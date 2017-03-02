#!/bin/bash

apt-get update
apt-get install -y libfuse2 jq
dpkg -i gcc-6-base_6.2.1-7_armhf.deb
dpkg -i libstdc++6_6.2.1-7_armhf.deb
dpkg -i lizardfs-client_3.10.4+dfsg-3_armhf.deb
