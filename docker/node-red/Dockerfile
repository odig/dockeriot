FROM node:9-stretch

MAINTAINER Gido Kuechler <gido@ukuechler.de>

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

LABEL version="iot"
LABEL description="Node-Red"

RUN apt-get update     && \
    apt-get upgrade -y && \
    apt-get install -y wget build-essential libwrap0-dev libssl-dev python-distutils-extra \
    libc-ares-dev uuid-dev

# Create node-red user, directories and source code.
RUN rm -rf /home/node-red \
    && adduser --gecos "" --home /home/node-red --shell /bin/sh --disabled-login node-red \
    && cd /home/node-red \
    && git clone https://github.com/node-red/node-red-docker.git \
    && cp node-red-docker/package.json . \
    && rm -rf node-red-docker \
    && npm install --unsafe-perm \
    && npm cache clean --force\
    && mkdir -p /data \
    && chown -R node-red:node-red /data /home/node-red

WORKDIR /home/node-red
USER node-red
VOLUME ["/data"]
EXPOSE 1880

CMD ["npm", "start", "--", "--userDir", "/data"]

