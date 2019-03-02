#!/usr/bin/env sh
# Build Docker Image

set -e

# clinch permissions
find etc -type f -exec chmod 644 {} \;
find sbin -type f -exec chmod 755 {} \;
find etc sbin -type d -exec chmod 755 {} \;
find etc/sudoers.d -type d -exec chmod 750 {} \;
find etc/sudoers.d -type f -exec chmod 440 {} \;

# build :latest
echo "$USER_PASSWORD" | xargs -I '@I' docker build --tag "$TRAVIS_REPO_SLUG" --build-arg USER_PASSWORD="@I" .
