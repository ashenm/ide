#!/usr/bin/env sh
# Deploy Docker Image

exec echo "$DOCKER_PASSWORD" | \
  docker login --username "${DOCKER_USERNAME}" --password-stdin && \
  docker push "${TRAVIS_REPO_SLUG:-ashenm/ide:developer}"
