#!/bin/sh
set -e
set -u

if [ -f che-machine-exec-plugin.tar.gz ]; then
    rm che-machine-exec-plugin.tar.gz
fi

cd etc
tar zcvf ../che-machine-exec-plugin.tar.gz .

