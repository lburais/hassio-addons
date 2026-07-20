ARG BUILD_VERSION=dev
ARG BUILD_ARCH

ARG BUILD_FROM
FROM crocodilestick/calibre-web-automated:latest

COPY root/ /
RUN chmod -R +x /etc/cont-init.d

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

ENV CWA_PORT_OVERRIDE=8083

EXPOSE 8083/tcp

# Bring in bashio for reading HA addon options
# COPY --from=ghcr.io/hassio-addons/base:16.0.5 /usr/bin/bashio /usr/bin/bashio
# COPY --from=ghcr.io/hassio-addons/base:16.0.5 /usr/lib/bashio /usr/lib/bashio

# COPY run.sh /
# RUN chmod a+x /run.sh

# ENTRYPOINT []
# CMD [ "/run.sh" ]