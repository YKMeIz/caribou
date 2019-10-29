FROM golang:alpine

RUN apk add --no-cache tzdata

WORKDIR /
COPY ./caribou .
COPY ./tpl/* ./tpl/
COPY ./static/* ./static/

EXPOSE 9090/tcp
ENV REDIS_ADDRESS=redis.local:6379
LABEL "proxy.steins.server.name"="pximg.ykz.dev"
LABEL "proxy.steins.server.proxy_port"="9090"

ENTRYPOINT ["/caribou"]
