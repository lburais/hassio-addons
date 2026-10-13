#!/bin/sh
set -e

# /config is the add-on config folder (addon_config), /data is persistent storage
mkdir -p /data/databases /data/logs /data/backups
rm -rf /data/config
ln -s /config /data/config

if [ ! -f /config/config.ini ]; then
  echo "No config.ini found, creating one from the example. Edit it in the add-on config folder."
  cp /app/config.ini.example /config/config.ini
fi

if [ -f /data/options.json ]; then
  TZ="$(python3 -c "import json;print(json.load(open('/data/options.json')).get('timezone',''))")"
  [ -n "$TZ" ] && export TZ
fi

cd /app
exec python3 meshcore_bot.py --config /data/config/config.ini
