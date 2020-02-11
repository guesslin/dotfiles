FROM golang:1.13-buster AS BUILDER

RUN go get -u github.com/tsenart/vegeta

FROM debian:buster

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates tcpdump bash && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=BUILDER /go/bin/vegeta /usr/bin/

CMD ["/bin/bash"]
