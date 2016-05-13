FROM phusion/baseimage

RUN apt-get update && \
  apt-get install -y \
  graphviz \
  inotify-tools

RUN mkdir -p /usr/src/{app,/graphs,/output}
WORKDIR /usr/src/app
COPY . .

VOLUME ["/usr/src/app/graphs", "/usr/src/app/output"]

ENTRYPOINT ["/sbin/my_init", "--", "./docker-entrypoint.sh"]
