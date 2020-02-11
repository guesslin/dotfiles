FROM alpine:3.9

LABEL maintainer=guesslin1986@gmail.com

RUN apk update && \
    apk add --no-cache bash curl docker ethtool ipcalc iptables iproute2 ebtables

ARG kubectl_version=v1.17.2
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

CMD /bin/bash
