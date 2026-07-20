#!/usr/bin/with-contenv bashio

export PUID=$(bashio::config 'puid')
export PGID=$(bashio::config 'pgid')
export TZ=$(bashio::config 'tz')
export CONFIG_PATH=$(bashio::config 'config')
export INGEST_PATH=$(bashio::config 'ingest')
export LIBRARY_PATH=$(bashio::config 'library')
export NETWORK_SHARE_MODE=$(bashio::config 'network_share_mode')
export CWA_PORT_OVERRIDE=8083

# Point CWA at HA's persistent volumes instead of Mac paths
# mkdir -p /share/calibre-web-automated/ingest /share/calibre-web-automated/library

ln -sfn $INGEST_PATH /cwa-book-ingest
ln -sfn $LIBRARY_PATH /calibre-library
ln -sfn $CONFIG_PATH /config   # HA's /config volume already mounted here via `map`

# Hand off to the original image's startup (check their Dockerfile/entrypoint for the exact binary/path)
exec /etc/s6-overlay/s6-rc.d/init-adduser/run