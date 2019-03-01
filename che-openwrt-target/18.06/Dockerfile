#FROM scratch ADD http://downloads.openwrt.org/releases/18.06.0/targets/x86/64/openwrt-18.06.0-x86-64-generic-rootfs.tar.gz /
# docker import http://downloads.openwrt.org/releases/18.06.0/targets/x86/64/openwrt-18.06.0-x86-64-generic-rootfs.tar.gz  openwrt-x86-generic-rootfs:18.06
FROM openwrt-x86-generic-rootfs:18.06

EXPOSE 9001

RUN mkdir /var/lock && \
    opkg update && \
    opkg install gdb git mc

ENTRYPOINT tail -f /dev/null