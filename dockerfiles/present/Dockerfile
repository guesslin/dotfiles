FROM golang:latest

MAINTAINER guesslin1986@gmail.com

RUN go get golang.org/x/net/websocket && \
    go get golang.org/x/tools/present && \
    go install golang.org/x/tools/cmd/present

VOLUME /opt/keynotes

WORKDIR /opt/keynotes

EXPOSE 3999
ENTRYPOINT present -http "0.0.0.0:3999"
