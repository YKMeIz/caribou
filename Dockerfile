FROM golang:alpine

RUN apk add --no-cache tzdata

WORKDIR /
COPY ./caribou .
ADD ./tpl/ ./tpl/
ADD ./static/ ./static/

EXPOSE 9090/tcp

ENTRYPOINT ["/caribou"]
