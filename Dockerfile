FROM alpine

RUN apk add --no-cache \
  graphviz \
  ttf-freefont \
  inotify-tools

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./docker-entrypoint.sh ./

VOLUME ["/usr/src/app/graphs", "/usr/src/app/output"]

ENTRYPOINT ["./docker-entrypoint.sh"]
