#!/bin/bash

[ -z "$SERVER_APP" ] && export SERVER_APP="app"
[ -z "$SERVER_PORT" ] && export SERVER_PORT="9000"
[ -z "$MAGE_MODE" ] && export MAGE_MODE="production"
[ -z "$MAGE_ROOT" ] && export MAGE_ROOT="/var/www/html"
[ -z "$ALLOW_ORIGIN" ] && export ALLOW_ORIGIN="*"
[ -z "$CLIENT_MAX_BODY_SIZE" ] && export CLIENT_MAX_BODY_SIZE="10M"

[ -z "$FASTCGI_BUFFER_SIZE" ] && export FASTCGI_BUFFER_SIZE="32k"
[ -z "$FASTCGI_BUFFERS_NUMBER" ] && export FASTCGI_BUFFERS_NUMBER="16"
[ -z "$FASTCGI_BUFFERS_SIZE" ] && export FASTCGI_BUFFERS_SIZE="16k"

if [ -z "$PROTOCOL" ]; then
    if [ "$MAGE_MODE" = "production" ]; then
        PROTOCOL="HTTPS";
    else
        PROTOCOL="HTTP";
    fi
fi

[ -z "$NGINX_KEEPALIVE_TIMEOUT" ] && export NGINX_KEEPALIVE_TIMEOUT="65"
[ -z "$NGINX_WORKER_CONNECTIONS" ] && export NGINX_WORKER_CONNECTIONS="1024"

[ -z "$PHP_MEMORY_LIMIT" ] && export PHP_MEMORY_LIMIT="768M"
[ -z "$PHP_EXECUTION_TIMEOUT" ] && export PHP_EXECUTION_TIMEOUT="600s"



sed -i 's=__server_app__='"$SERVER_APP"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__server_port__='"$SERVER_PORT"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__mage_mode__='"$MAGE_MODE"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__mage_root__='"$MAGE_ROOT"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__allow_origin__='"$ALLOW_ORIGIN"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__client_max_body_size__='"$CLIENT_MAX_BODY_SIZE"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__protocol__='"$PROTOCOL"'=g' /etc/nginx/conf.d/default.conf

sed -i 's=__nginx_keepalive_timeout__='"$NGINX_KEEPALIVE_TIMEOUT"'=g' /etc/nginx/nginx.conf
sed -i 's=__nginx_worker_connections__='"$NGINX_WORKER_CONNECTIONS"'=g' /etc/nginx/nginx.conf

sed -i 's=__fastcgi_buffer_size__='"$FASTCGI_BUFFER_SIZE"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__fastcgi_buffers_number__='"$FASTCGI_BUFFERS_NUMBER"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__fastcgi_buffers_size__='"$FASTCGI_BUFFERS_SIZE"'=g' /etc/nginx/conf.d/default.conf

sed -i 's=__php_memory_limit__='"$PHP_MEMORY_LIMIT"'=g' /etc/nginx/conf.d/default.conf
sed -i 's=__php_execution_timeout__='"$PHP_EXECUTION_TIMEOUT"'=g' /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
