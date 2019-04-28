#!/usr/bin/env sh
# Remove Docker Image Builds

exec docker images --format "{{.ID}}" "${TRAVIS_REPO_SLUG:-ashenm/ide}" | xargs -r docker rmi
