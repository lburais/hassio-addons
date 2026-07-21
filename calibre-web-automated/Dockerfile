ARG BUILD_VERSION=dev
ARG BUILD_ARCH

#ARG BUILD_FROM
FROM crocodilestick/calibre-web-automated:latest

COPY root/ /
RUN chmod -R +x /etc/cont-init.d

RUN for d in /etc/s6-overlay/s6-rc.d/*/; do \
      svc=$(basename "$d"); \
      case "$svc" in base|fix-attrs|legacy-cont-init|legacy-services|s6rc-oneshot-runner) continue ;; esac; \
      [ -f "$d/type" ] || continue; \
      t=$(cat "$d/type"); \
      if [ "$t" = "oneshot" ] || [ "$t" = "longrun" ]; then \
        mkdir -p "$d/dependencies.d"; \
        touch "$d/dependencies.d/base"; \
      fi; \
    done
LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

ENV CWA_PORT_OVERRIDE=8083

EXPOSE 8083/tcp