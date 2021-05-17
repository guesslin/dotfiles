FROM alpine:3.9

LABEL maintainer=guesslin1986@gmail.com

RUN apk update && \
    apk add --no-cache bash curl docker ethtool ipcalc iptables iproute2 ebtables openvswitch jq

ARG kubectl_version=v1.17.2
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

ARG crictl_version=v1.17.0
RUN curl -L https://github.com/kubernetes-sigs/cri-tools/releases/download/${crictl_version}/crictl-${crictl_version}-linux-amd64.tar.gz --output crictl.tar.gz && \
    tar zxvf crictl.tar.gz -C /usr/local/bin && \
    rm -f crictl.tar.gz

CMD /bin/bash
