#!/usr/bin/env sh
# Build Docker Image

set -e

# clinch permissions
find ide -type f -exec chmod 644 {} \;
find ide -type d -exec chmod 755 {} \;
find ide/etc/profile.d -type f -exec chmod 755 {} \;
find ide/c9sdk/start-server.sh -type f -exec chmod 755 {} \;

# build :latest-alpha
docker build --tag "${TRAVIS_REPO_SLUG:-ashenm/ide:latest-alpha}" .
