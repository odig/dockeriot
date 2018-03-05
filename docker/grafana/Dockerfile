FROM buildpack-deps:stretch-curl

ENV GRAFANA_VERSION 5.0.0

RUN apt-get update \
 && apt-get install -y apt-transport-https \
 && echo "deb https://packagecloud.io/grafana/stable/debian/ jessie main" >> /etc/apt/sources.list \
 && curl https://packagecloud.io/gpg.key | apt-key add - \
 && apt-get update \
 && apt-get install -y grafana \
 && whereis grafana-server

CMD ["/usr/sbin/grafana-server","-homepath","/usr/share/grafana"]


