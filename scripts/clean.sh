#!/usr/bin/env sh
# Remove Docker Images

# select only `latest-alpha` tag
# unless explicitly specified
test "$1" = "-a" \
  -o "$1" = "--all" \
    && TRAVIS_BRANCH="*"

# remove selected images
docker images --all --filter reference="${TRAVIS_REPO_SLUG:-ashenm/ide}:${TRAVIS_BRANCH:-latest-alpha}" \
  | awk 'NR>1 { print $3 }' \
  | xargs -r docker rmi --force
