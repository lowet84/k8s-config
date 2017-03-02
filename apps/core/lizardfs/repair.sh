#!/bin/bash

mkdir -p mfsRepairTemp
mfsmount -H localhost -P 30421 mfsRepairTemp
for d in $(find mfsRepairTemp -type d)
do
  #Do something, the directory is accessible with $d:
  echo $d
  mfsfilerepair $d/*
done

umount mfsRepairTemp
rmdir mfsRepairTemp
