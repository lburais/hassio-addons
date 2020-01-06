FROM arm64v8/ubuntu:xenial-20191212

# Ports
EXPOSE 3478/udp
# Used for STUN
EXPOSE 6789/tcp
# Used for UniFi mobile speed test
EXPOSE 8080/tcp
# Used for device and controller communication
EXPOSE 8443/tcp
# Used for controller web interface and API
EXPOSE 8843/tcp
# Used for HTTPS portal redirection
EXPOSE 8880/tcp
# Used for HTTP portal redirection
EXPOSE 10001/udp
# Used for device discovery

# Environment variables
ENV DEBIAN_FRONTEND="noninteractive"
ENV HOME="/root"
ENV LANG="C.UTF-8"
ENV PS1="$(whoami)@$(hostname):$(pwd)$ "
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
ENV S6_CMD_WAIT_FOR_SERVICES=1
ENV TERM="xterm"

ENV BASHIO_VERSION=0.6.0
ENV S6_VERSION=1.22.1.0
ENV S6_ARCH=aarch64
ENV UNIFI_VERSION=5.6.42

# Copy root filesystem
COPY rootfs /

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Dependencies
RUN apt-get update
RUN apt-get install -y --no-install-recommends ca-certificates curl jq tzdata wget

# S6
RUN curl -L -s "https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-${S6_ARCH}.tar.gz" | tar zxvf - -C /
RUN mkdir -p /etc/fix-attrs.d
RUN mkdir -p /etc/services.d

# bashio
RUN [ "/bin/bash", "-c", "curl -J -L -o /tmp/bashio.tar.gz https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz"]
RUN mkdir /tmp/bashio
RUN tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio
RUN mv /tmp/bashio/lib /usr/lib/bashio
RUN ln -s /usr/lib/bashio/bashio /usr/bin/bashio

# Unifi
RUN apt-get update
RUN apt-get install -y --no-install-recommends binutils jsvc openjdk-8-jdk-headless mongodb
RUN [ "/bin/bash", "-c", "curl -J -L -o /tmp/unifi.deb https://dl.ui.com/unifi/${UNIFI_VERSION}/unifi_sysvinit_all.deb"]
RUN dpkg --install /tmp/unifi.deb

# cleanup
RUN rm -f -r /tmp/* /var/{cache,log}/* /var/lib/apt/lists/*

# Entrypoint & CMD
ENTRYPOINT [ "/init" ]
