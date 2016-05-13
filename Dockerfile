FROM phusion/baseimage

RUN apt-get update && \
  apt-get install -y \
  graphviz \
  inotify-tools

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

VOLUME ["/usr/src/app"]

ENTRYPOINT ["/sbin/my_init", "--", "./docker-entrypoint.sh"]
