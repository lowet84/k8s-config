#!/bin/bash
while :
do
  echo "backing up etcd"
  etcdctl backup --data-dir /var/etcd/data --backup-dir /var/etcd/backup
  cd /var/etcd/
  echo "creating etcd.tar.gz"
  tar -czvf etcd.tar.gz backup
  echo "removing backup folder"
  rm -r backup
  cd /
  echo "creating latest backup tag file"
  echo "$RANDOM" > /var/etcd/backup.tag
  echo "Sleepin $SLEEP"
  sleep $SLEEP
done
