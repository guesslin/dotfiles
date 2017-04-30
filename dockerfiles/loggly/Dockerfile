FROM buildpack-deps:xenial-scm

MAINTAINER Lin, Yu-Han <guesslin1986@gmail.com>

RUN apt-get update && apt-get install -y rsyslog && \
    rm -rf /var/lib/apt/lists/* \
    rm -f /etc/rsyslog.conf && \
    rm -f /etc/rsyslog.d/50-default.conf

ADD rsyslog.conf /etc/rsyslog.conf
ADD 22-loggly.conf /etc/rsyslog.d/22-loggly.conf
ADD run.sh /tmp/run.sh

EXPOSE 514
EXPOSE 514/udp

CMD ["/tmp/run.sh"]
