#!/usr/bin/env sh
# Configure CI Environment

set -e

# pull dependent image
docker pull ashenm/baseimage:developer
