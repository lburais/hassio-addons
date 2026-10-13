#!/bin/sh
set -e

# /config is the add-on config folder (addon_config), /data is persistent storage
mkdir -p /data/databases /data/logs /data/backups
rm -rf /data/config
ln -s /config /data/config

if [ ! -f /config/config.ini ]; then
  echo "No config.ini found, creating one from the minimal example. Edit it in the add-on config folder."
  cp /config.ini.minimal-example /config/config.ini
fi

# Apply add-on options to config.ini and export the timezone
eval "$(python3 - <<'PY'
import json, re, shlex

opts = json.load(open('/data/options.json'))
path = '/config/config.ini'
text = open(path).read()

def setkey(text, section, key, value):
    sec = re.search(r'^\[%s\][ \t]*$' % re.escape(section), text, re.M)
    if not sec:
        return text
    nxt = re.search(r'^\[', text[sec.end():], re.M)
    end = sec.end() + nxt.start() if nxt else len(text)
    body = text[sec.end():end]
    line = '%s = %s' % (key, value)
    body, n = re.subn(r'^%s[ \t]*=.*$' % re.escape(key), lambda m: line, body, count=1, flags=re.M)
    if not n:
        body = '\n' + line + body
    return text[:sec.end()] + body + text[end:]

for section, key in (('Connection', 'connection_type'), ('Connection', 'serial_port'), ('Bot', 'bot_name')):
    if opts.get(key):
        text = setkey(text, section, key, opts[key])
open(path, 'w').write(text)
if opts.get('timezone'):
    print('export TZ=%s' % shlex.quote(opts['timezone']))
PY
)"

cd /app
exec python3 meshcore_bot.py --config /data/config/config.ini
