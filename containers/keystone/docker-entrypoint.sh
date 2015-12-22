#!/usr/bin/env bash
DB_HOST=${DB_HOST:-'localhost'}
DB_PORT=${DB_PORT:-3306}
DB_NAME=${DB_NAME:-'keystone'}
DB_USER=${DB_USER:-'keystone'}
DB_PASSWORD=${DB_PASSWORD:-'keystone'}
ADMIN_TOKEN=${ADMIN_TOKEN:-'token'}
MEMCACHED_URL=${MEMCACHED_URL:-'localhost:11211'}
DEBUG=${DEBUG:-False}
VERBOSE=${VERBOSE:-True}
conf=/etc/keystone/keystone.conf

crudini --set $conf DEFAULT admin_token $ADMIN_TOKEN
crudini --set $conf DEFAULT verbose $VERBOSE
crudini --set $conf DEFAULT debug $DEBUG
crudini --set $conf database connection mysql+pymysql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}
crudini --set $conf memcache servers $MEMCACHED_URL
crudini --set $conf token provider uuid
crudini --set $conf token driver memcache
crudini --set $conf revoke driver sql

rm -f /var/lib/keystone/keystone.db

su -s /bin/sh -c "keystone-manage db_sync" keystone

apache2ctl -DFOREGROUND