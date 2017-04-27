FROM buildpack-deps:xenial-scm

MAINTAINER Lin, Yu-Han <guesslin1986@gmail.com>

RUN apt-get update && apt-get install -y rsyslog rsyslog-gnutls && \
    rm -rf /var/lib/apt/lists/* \
    rm -f /etc/rsyslog.conf && \
    mkdir -pv /etc/rsyslog.d/keys/ca.d && \
    cd /etc/rsyslog.d/keys/ca.d/ && \
    curl -O https://logdog.loggly.com/media/logs-01.loggly.com_sha12.crt

ADD rsyslog.conf /etc/rsyslog.conf
ADD run.sh /tmp/run.sh

EXPOSE 514
EXPOSE 514/udp

CMD ["/tmp/run.sh"]
