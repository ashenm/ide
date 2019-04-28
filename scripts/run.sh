#!/usr/bin/env sh
# Swpan a Docker Container

exec docker run --rm --interactive --tty --name cloud9-ide \
  --env "PORT=5050" --env "IP=0.0.0.0" --publish 5050:5050 --publish 8080-8082:8080-8082 \
  --volume /tmp/credentials-ide:/tmp/credentials:ro ${TRAVIS_REPO_SLUG:-ashenm/ide:developer}
