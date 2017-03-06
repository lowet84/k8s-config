#!/bin/bash

mkdir -p /guacamole-temp
echo "sh /opt/guacamole/bin/initdb.sh --mysql > /data/init.sql" > /guacamole-temp/init.sh
docker run --rm -it --name guacamole-init \
  -e MYSQL_HOSTNAME="guacamole-mysql.utils.svc.cluster.local" \
  -v /guacamole-temp:/data \
  glyptodon/guacamole sh /data/init.sh

docker rm -f mysql-temp
docker run -d -it --name mysql-temp \
  -v /mnt/filer/Settings/guacamole:/var/lib/mysql \
  -v /guacamole-temp:/data \
  -p 3307:3306 \
  -e MYSQL_ROOT_PASSWORD=gurkburk \
  mysql

#docker exec -it mysql-temp bash

#docker logs mysql-temp
#docker rm -f mysql-temp
