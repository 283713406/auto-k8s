#!/bin/sh

set -x
cd /etc/raddb/mods-enabled
ln -sf ../mods-available/sql sql
cd /
set -e

if [ "$#" -eq 0 ] || [ "${1#-}" != "$1" ]; then
    set -- freeradius "$@"
fi

if [ "$1" = 'freeradius' ]; then
    shift
    exec freeradius -f "$@"
fi

if [ "$1" = 'radiusd' ]; then
    shift
    exec freeradius -f "$@"
fi

exec "$@"