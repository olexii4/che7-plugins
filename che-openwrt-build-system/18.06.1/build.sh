#!/bin/sh
set -e
set -u

docker build -f Dockerfile -t olexii4dockerid/openwrt-x86-generic-rootfs:18.06 .