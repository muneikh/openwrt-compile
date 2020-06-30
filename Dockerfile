FROM ubuntu

Maintainer "Muneeb Sheikh" <muneeb118@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
    
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext libssl-dev ccache xsltproc unzip wget python python3 && apt-get update

RUN git clone https://git.openwrt.org/openwrt/openwrt.git

WORKDIR openwrt

RUN ./scripts/feeds update -a && ./scripts/feeds install -a

RUN menuconfig

RUN make -j1 V=s:
