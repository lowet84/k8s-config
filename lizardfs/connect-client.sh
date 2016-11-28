#!/bin/bash

mkdir -p /mfs
mfsmount -H localhost -P 30421 -o enablefilelocks=0 /mfs
