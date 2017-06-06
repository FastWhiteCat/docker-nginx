#!/bin/bash

if [ -z "$SERVER_APP" ]; then
    SERVER_APP="app"
fi

if [ -z "$SERVER_PORT" ]; then
    SERVER_PORT="9000"
fi

if [ -z "$MAGE_MODE" ]; then
    MAGE_MODE="production"
fi

if [ -z "$MAGE_ROOT" ]; then
    MAGE_ROOT="/var/www/html"
fi

sed -i 's=__server_app__='"$SERVER_APP"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__server_port__='"$SERVER_PORT"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__mage_mode__='"$MAGE_MODE"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__mage_root__='"$MAGE_ROOT"'=g' /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
