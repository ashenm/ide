#!/usr/bin/env sh
# Remove Untagged Docker Images

exec docker images --filter dangling=true --format "{{.ID}}" | xargs -r docker rmi
