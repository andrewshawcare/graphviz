FROM alpine:3.5

RUN apk add --no-cache \
  graphviz \
  font-bitstream-type1 \
  inotify-tools \
  tini

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./docker-entrypoint.sh ./

VOLUME ["/usr/src/app/graphs", "/usr/src/app/output"]

ENTRYPOINT ["/sbin/tini", "--", "./docker-entrypoint.sh"]
