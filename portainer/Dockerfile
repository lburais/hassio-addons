ARG BUILD_VERSION=dev
ARG BUILD_ARCH

FROM portainer/portainer-ce:lts

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

EXPOSE 8000/tcp
EXPOSE 9443/tcp