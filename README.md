
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
        -e MAGE_ROOT="/var/www/html/" fastwhitecat/nginx
```

Build:

```bash

docker build -t nginx .

```
