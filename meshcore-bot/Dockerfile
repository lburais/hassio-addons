ARG BUILD_VERSION=dev
ARG BUILD_ARCH

FROM ghcr.io/agessaman/meshcore-bot:latest

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

USER root

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT []
CMD ["/run.sh"]
