FROM phusion/baseimage

RUN apt-get update && \
  apt-get install -y \
  graphviz

ENTRYPOINT ["/sbin/my_init", "--", "dot"]
