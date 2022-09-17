#!/usr/bin/env bash

MYSQL_HOST=$MYSQL_HOST
USERNAME=$USERNAME
PASSWORD=$PASSWORD
MYSQL_PORT=$MYSQL_PORT

mysql -h $MYSQL_HOST -P MYSQL_PORT --default-character-set=utf8mb4 -u $USERNAME -p$PASSWORD << EOF
    source /opt/kcm-init-database.sql
    source /opt/kcm-init-tables.sql
    source /opt/kcm-init-datas.sql
EOF
