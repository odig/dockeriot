FROM node:9-stretch

MAINTAINER Gido Kuechler <gido@ukuechler.de>

LABEL version="iot"
LABEL description="homeeToMqtt"

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
    libc-ares-dev uuid-dev

# Create homeeToMqtt user, directories and source code.
RUN rm -rf /home/homeetomqtt \
    && adduser --gecos "" --home /home/homeetomqtt --shell /bin/sh --disabled-login homeetomqtt \
    && cd /home/homeetomqtt \
    && git clone https://github.com/odig/homeeToMqtt.git \
    && cd homeeToMqtt \
    && git checkout develop \
    && npm install --unsafe-perm \
    && npm cache clean --force \
    && chown -R homeetomqtt:homeetomqtt /home/homeetomqtt

WORKDIR /home/homeetomqtt/homeeToMqtt
#COPY config.json /home/homeetomqtt/homeeToMqtt

USER homeetomqtt

CMD node app.js
