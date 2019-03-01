#!/bin/sh
set -e
set -u

if [ -f che-editor-plugin.tar.gz ]; then
    rm che-editor-plugin.tar.gz
fi

docker build -f Dockerfile -t olexii4dockerid/che-theia:0.3.19 --build-arg GITHUB_TOKEN=$GITHUB_TOKEN .

cd etc
tar zcvf ../che-editor-plugin.tar.gz .