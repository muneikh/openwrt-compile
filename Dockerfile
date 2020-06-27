FROM ubuntu

Maintainer "Muneeb Sheikh" <muneeb118@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
    
RUN git clone https://git.openwrt.org/openwrt/openwrt.git

RUN cd openwrt

RUN echo '::pwd'

RUN ./scripts/feeds update -a

RUN ./scripts/feeds install -a

RUN sudo apt-get install build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib flex git-core gettext libssl-dev

RUN sudo apt update

RUN menuconfig

RUN make -j1 V=s
