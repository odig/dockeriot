FROM buildpack-deps:stretch-curl

ARG  MOSQUITTOVERSION
ENV  MOSQUITTOVERSION 1.4.14

MAINTAINER Gido Kuechler <gido@ukuechler.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
    libc-ares-dev uuid-dev libssl-dev

RUN     mkdir -p /usr/local/src
WORKDIR /usr/local/src
RUN     wget http://mosquitto.org/files/source/mosquitto-$MOSQUITTOVERSION.tar.gz
RUN     tar xvzf ./mosquitto-$MOSQUITTOVERSION.tar.gz
WORKDIR /usr/local/src/mosquitto-$MOSQUITTOVERSION
RUN     apt-get install -y libwebsockets-dev
RUN     sed -i 's/WITH_WEBSOCKETS:=no/WITH_WEBSOCKETS:=yes/' config.mk; ls -l; grep WEBSOCKETS config.mk
RUN     make && make install

RUN     adduser --system --disabled-password --disabled-login mosquitto
USER    mosquitto

EXPOSE 1883 
EXPOSE 1884

CMD ["/usr/local/sbin/mosquitto"]


