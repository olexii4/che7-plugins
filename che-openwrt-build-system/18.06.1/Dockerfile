# https://github.com/noonien/docker-openwrt-buildroot/blob/master/18.06/Dockerfile
FROM ubuntu:18.04

RUN apt-get update &&\
    apt-get install -y sudo time git-core subversion build-essential gcc-multilib \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python mc &&\
    apt-get clean

RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt

COPY etc/openwrt /home/openwrt

ENTRYPOINT tail -f /dev/null