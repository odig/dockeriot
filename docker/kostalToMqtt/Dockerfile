FROM node:9-stretch

MAINTAINER Gido Kuechler <gido@ukuechler.de>

LABEL version="iot"
LABEL description="kostalToMqtt"

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
    libc-ares-dev uuid-dev

# Create kostalToMqtt user, directories and source code.
RUN rm -rf /home/kostaltomqtt \
    && adduser --gecos "" --home /home/kostaltomqtt --shell /bin/sh --disabled-login kostaltomqtt \
    && cd /home/kostaltomqtt \
    && git clone https://github.com/odig/kostalToMqtt.git \
    && cd kostalToMqtt \
    && git checkout master \
    && npm install --unsafe-perm \
    && npm cache clean --force \
    && chown -R kostaltomqtt:kostaltomqtt /home/kostaltomqtt

WORKDIR /home/kostaltomqtt/kostalToMqtt
#COPY config.json /home/kostaltomqtt/kostalToMqtt

USER kostaltomqtt

CMD node app.js
