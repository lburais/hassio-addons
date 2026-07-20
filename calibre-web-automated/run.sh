#!/usr/bin/with-contenv bash

echo "[run.sh] Applying Home Assistant options for Calibre-Web Automated"

export PUID=$(bash::config 'puid')
export PGID=$(bash::config 'pgid')
export TZ=$(bash::config 'tz')
export CONFIG_PATH=$(bash::config 'config')
export INGEST_PATH=$(bash::config 'ingest')
export LIBRARY_PATH=$(bash::config 'library')
export NETWORK_SHARE_MODE=$(bash::config 'network_share_mode')
export CWA_PORT_OVERRIDE=8083

# Point CWA at HA's persistent volumes instead of Mac paths
# mkdir -p /share/calibre-web-automated/ingest /share/calibre-web-automated/library

rm -rf /config /cwa-book-ingest /calibre-library

ln -sfn $INGEST_PATH  /cwa-book-ingest
ln -sfn $LIBRARY_PATH /calibre-library
ln -sfn $CONFIG_PATH  /config   # HA's /config volume already mounted here via `map`

# Hand off to the original image's startup (check their Dockerfile/entrypoint for the exact binary/path)
exec /etc/s6-overlay/s6-rc.d/cwa-init/run