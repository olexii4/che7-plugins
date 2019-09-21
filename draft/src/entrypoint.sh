#!/bin/bash

# run theia
yarn --cwd /home/theia/examples/browser start --hostname=0.0.0.0  --port=3100 &

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done
