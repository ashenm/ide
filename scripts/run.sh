#!/usr/bin/env sh
# Swpan a Docker Container

exec docker run --detach --rm --hostname ide --publish 8787:8787 ashenm/ide:developer