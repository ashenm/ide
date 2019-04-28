#!/usr/bin/env sh

exec cat /tmp/credentials | \
  xargs -I "%%" node /home/ubuntu/.c9sdk/server.js -w /home/ubuntu/workspace \
    --auth "%%" --listen "${IP:=0.0.0.0}" --port "${PORT:=5050}" --workspacetype ashenm
