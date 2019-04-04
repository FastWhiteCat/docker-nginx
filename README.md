
# Container with Nginx for Magento 2

[![Docker Stars](https://img.shields.io/docker/stars/fastwhitecat/nginx.svg)](https://hub.docker.com/r/fastwhitecat/nginx/)
[![Docker Pulls](https://img.shields.io/docker/pulls/fastwhitecat/nginx.svg)](https://hub.docker.com/r/fastwhitecat/nginx/)

Included:

- Nginx
- Files configuration

## Description

Docker container Nginx for Magento 2.

## Quick Start

Run:

```bash
docker run -Pit --name=nginx fastwhitecat/nginx
```
Run with configuration:

```bash
docker run -Pit --name=nginx \
        -e SERVER_APP="127.0.0.1" \
        -e SERVER_PORT="9000" \
        -e MAGE_MODE="developer" \
        -e MAGE_ROOT="/var/www/html/" \
        -e NGINX_KEEPALIVE_TIMEOUT="65" \
        -e NGINX_WORKER_CONNECTIONS="1024" fastwhitecat/nginx
```

### List of env

|env|default|
|---|:--:|
|SERVER_APP|`app`|
|SERVER_PORT|`9000`|
|MAGE_MODE|`production`|
|MAGE_ROOT|`/var/www/html`|
|ALLOW_ORIGIN|`*`|
|CLIENT_MAX_BODY_SIZE|`10M`|
|FASTCGI_BUFFER_SIZE|`32k`|
|FASTCGI_BUFFERS_NUMBER|`16`|
|FASTCGI_BUFFERS_SIZE|`16k`|
|NGINX_KEEPALIVE_TIMEOUT|`65`|
|NGINX_WORKER_CONNECTIONS|`1024`|
|PHP_MEMORY_LIMIT|`768M`|
|PHP_EXECUTION_TIMEOUT|`600s`|

Build:

```bash

docker build -t nginx .

```
