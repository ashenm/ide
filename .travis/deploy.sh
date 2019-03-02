#!/usr/bin/env sh

set -e

# authenticate
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin

# deploy image
docker push "$TRAVIS_REPO_SLUG"
