# Docker-compose file for a IOT environment for homee
## About
This repo provides all you need to setup a couple of docker instances to bring more IOT stuff to homee.
Products used are:
* MQTT/Mosquitto
* InfluxDB
* Grafana stack
* Node-Red
* homeeToMqtt
## Prerequisites
* docker
* docker-compose
* user must belong to docker group 
### raspian stretch
Die neue Kurzform:

    curl -sSL https://get.docker.com | sh

Siehe:

https://sebastianbrosch.blog/2017/docker-auf-einem-raspberry-pi-3-installieren/

### debian
https://docs.docker.com/install/linux/docker-ce/debian/

## Add user do docker group
To add the user following command will do it for you:

    sudo usermod -aG docker pi

now we need to relogin

## Install
Clone this repo

    cd dockeriot
    ./run.sh
    
to see the install and programs running:

    docker-compose up
    
or for raspi

    docker-compose -f docker-compose-raspi.yml up

## Defaults
### Grafana
  * port: 3000
  * user: admin
  * passwd: admin
### Influxdb
  * port: 8086
  * user: admin
  * passwd: admin
  * user: iot (read/write)
  * passwd: iot
  * user: read (read)
  * passwd: read
  * user: write (write)
  * passwd: write
### Node-RED
  * port:1880
  * sample-flow: node-red.flow
### homeeToMqtt
  * config.json: docker/homeeToMqtt/config.json
## more has to come
