ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_VERSION
ARG BUILD_ARCH

# Add env
ENV LANG C.UTF-8

# Setup base system
RUN apt-get install -y --no-install-recommends \
        binutils=2.30-21ubuntu1~18.04.2 \
        jsvc=1.0.15-8 \
        libcap2=1:2.25-1.2 \
        mongodb-server=1:2.6.10-0ubuntu1 \
        openjdk-8-jdk-headless=8u222-b10-1ubuntu1~18.04.1 \
    \
    && curl -J -L --output /tmp/unifi.deb \
        "https://dl.ui.com/unifi/${BUILD_VERSION%-*}/unifi_sysvinit_all.deb" \
    \
    && dpkg --install /tmp/unifi.deb \
    \
    && rm -fr \
        /tmp/* \
        /root/.gnupg \
        /var/{cache,log}/* \
        /var/lib/apt/lists/*

# Copy root filesystem
COPY rootfs /
