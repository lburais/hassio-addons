ARG BUILD_VERSION=dev
ARG BUILD_ARCH
ARG BASHIO_VERSION="0.17.2"

FROM crocodilestick/calibre-web-automated:latest

# --- bashio (installed from release, no base-image tag dependency) ---
RUN apt-get update && apt-get install -y --no-install-recommends curl unzip ca-certificates
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir /tmp/bashio
RUN cd /tmp/bashio
RUN curl -sSL -o bashio.zip "https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.zip" \
 && unzip bashio.zip
RUN mv bashio-${BASHIO_VERSION}/lib /usr/lib/bashio
RUN ln -s /usr/lib/bashio/bashio /usr/bin/bashio
RUN cd ..
RUN rm -rf /tmp/bashio*

#  RUN apt-get update && apt-get install -y --no-install-recommends curl tar ca-certificates \
#  && rm -rf /var/lib/apt/lists/* \
#  && mkdir /tmp/bashio \
#  && curl -J -L -o /tmp/bashio.tar.gz "https://github.com/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz" \
#  && tar zxf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
#  && mv /tmp/bashio/lib /usr/lib/bashio \
#  && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
#  && rm -rf /tmp/bashio*

# --- addon-options oneshot (replaces /etc/cont-init.d/20-addon-options) ---
RUN mkdir -p /etc/s6-overlay/s6-rc.d/addon-options/dependencies.d \
 && echo "oneshot" > /etc/s6-overlay/s6-rc.d/addon-options/type \
 && touch /etc/s6-overlay/s6-rc.d/addon-options/dependencies.d/base \
 && cat > /etc/s6-overlay/s6-rc.d/addon-options/up << 'EOF'
#!/usr/bin/with-contenv bashio
PUID=$(bashio::config 'PUID')
PGID=$(bashio::config 'PGID')
TZ=$(bashio::config 'TZ')
CONFIG_PATH=$(bashio::config 'CONFIG_PATH')
INGEST_PATH=$(bashio::config 'INGEST_PATH')
LIBRARY_PATH=$(bashio::config 'LIBRARY_PATH')

for v in PUID PGID TZ CONFIG_PATH INGEST_PATH LIBRARY_PATH; do
  printf '%s' "${!v}" > /run/s6/container_environment/"$v"
done
EOF
RUN chmod +x /etc/s6-overlay/s6-rc.d/addon-options/up

# --- register it in the boot bundle ---
RUN mkdir -p /etc/s6-overlay/s6-rc.d/user/contents.d \
 && touch /etc/s6-overlay/s6-rc.d/user/contents.d/addon-options

# --- force every native service to wait for addon-options ---
RUN for d in /etc/s6-overlay/s6-rc.d/*/; do \
      svc=$(basename "$d"); \
      case "$svc" in base|fix-attrs|legacy-cont-init|legacy-services|s6rc-oneshot-runner|addon-options|user|user2) continue ;; esac; \
      [ -f "$d/type" ] || continue; \
      t=$(cat "$d/type"); \
      if [ "$t" = "oneshot" ] || [ "$t" = "longrun" ]; then \
        mkdir -p "$d/dependencies.d"; \
        touch "$d/dependencies.d/addon-options"; \
      fi; \
    done

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

ENV CWA_PORT_OVERRIDE=8083

EXPOSE 8083/tcp