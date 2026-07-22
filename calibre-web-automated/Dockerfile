ARG BUILD_VERSION=dev
ARG BUILD_ARCH

FROM crocodilestick/calibre-web-automated:latest

COPY root/ /
RUN chmod -R +x /etc/s6-overlay/s6-rc.d

RUN apt-get update && apt-get install -y --no-install-recommends tree

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

ENV CWA_PORT_OVERRIDE=8083

EXPOSE 8083/tcp