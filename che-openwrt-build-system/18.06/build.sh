#!/bin/sh
set -e
set -u

if [ -z etc/openwrt ]; then
    cd etc
    git clone git://git.openwrt.org/openwrt/openwrt.git -b openwrt-18.06
    cd ../
fi

cd etc/openwrt && make menuconfig && cd ../../ && docker build -f Dockerfile -t olexii4dockerid/openwrt-x86-generic-rootfs:18.06 .