#!/usr/bin/env sh
# Build Docker Image

set -e

# clinch permissions
find etc -type f -exec chmod 644 {} \;
find sbin -type f -exec chmod 755 {} \;
find etc sbin -type d -exec chmod 755 {} \;
find etc/sudoers.d -type d -exec chmod 750 {} \;
find etc/sudoers.d -type f -exec chmod 440 {} \;

# build :developer
docker build --tag "ashenm/ide:developer" .
