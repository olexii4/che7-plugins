# https://github.com/noonien/docker-openwrt-buildroot/blob/master/18.06/Dockerfile
FROM ubuntu:18.04

RUN apt-get update &&\
    apt-get install -y sudo time git-core subversion build-essential gcc-multilib \
                       libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python mc &&\
    apt-get clean

RUN useradd -m openwrt &&\
    echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt

RUN cd /home/openwrt && git clone git://git.openwrt.org/openwrt/openwrt.git -b openwrt-18.06 &&\
    cd openwrt && ./scripts/feeds update -a  && ./scripts/feeds install -a

ADD etc/.config /home/openwrt/openwrt/.config

RUN cd /home/openwrt/openwrt && sudo chmod -f 777 .config && make defconfig && make -j1 V=s

ENTRYPOINT tail -f /dev/null