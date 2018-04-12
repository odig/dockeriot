FROM node:9-stretch

MAINTAINER Gido Kuechler <gido@ukuechler.de>

LABEL version="iot"
LABEL description="homeeup"

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
    libc-ares-dev uuid-dev

# Create homeeup user, directories and source code.
RUN rm -rf /home/homeeup \
    && adduser --gecos "" --home /home/homeeup --shell /bin/sh --disabled-login homeeup \
    && cd /home/homeeup \
    && git clone https://github.com/kdietrich/homeeup.git \
    && cd homeeup \
    && git checkout master \
    && npm install --unsafe-perm \
    && npm cache clean --force \
    && mkdir -p /home/homeeup/.homeeup \
    && chown -R homeeup:homeeup /home/homeeup/.homeeup \
    && chown -R homeeup:homeeup /home/homeeup

WORKDIR /home/homeeup/homeeup
#COPY config.json /home/homeeup/homeeup/.homeeup

USER homeeup

#CMD ./bin/homeeup
CMD npm start
