#!/bin/sh
set -e

# /config is the add-on config folder (addon_config), /data is persistent storage
mkdir -p /data/databases /data/logs /data/backups
rm -rf /data/config
ln -s /config /data/config

if [ ! -f /config/config.ini ]; then
  echo "No config.ini found, creating one from the default config. Edit it in the add-on config folder."
  cp /config.ini.default /config/config.ini
fi

cd /app
exec python3 meshcore_bot.py --config /config/config.ini
