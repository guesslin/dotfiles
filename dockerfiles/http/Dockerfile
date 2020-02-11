FROM golang:1.13-buster AS builder

WORKDIR /go/src/github.com/guesslin/http
COPY . .
RUN go build -o /go/bin/http

FROM debian:buster

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates tcpdump bash && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /go/bin/http /usr/bin/

EXPOSE 80/tcp
CMD ["/usr/bin/http"]
