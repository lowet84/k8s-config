#!/bin/bash

getbackup() {
  rm current.tag
  mv remote.tag current.tag
  wget http://etcd-backup/etcd.tar.gz -O etcd-remote.tar.gz
  if [ -f etcd-remote.tar.gz ]; then
    rm etcd.tar.gz
    mv etcd-remote.tar.gz etcd.tar.gz
  fi
}

cd /backup
while :
do
  wget http://etcd-backup/backup.tag -O remote.tag
  REMOTE=$(cat remote.tag)
  if [ ! -f current.tag ]; then
    getbackup
  elif [ "$(cat current.tag)" -ne $REMOTE ]; then
    getbackup
  else
    echo "Backup is current"
    rm remote.tag
  fi
  echo "Sleepin $SLEEP"
  sleep $SLEEP
done
