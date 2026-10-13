# MeshCore Bot add-on

Runs [meshcore-bot](https://github.com/agessaman/meshcore-bot) (image `ghcr.io/agessaman/meshcore-bot`).

## Setup

1. Start the add-on once: it creates `config.ini` in the add-on config folder (`/addon_configs/<slug>_meshcore-bot/`).
2. Edit `config.ini` (serial port such as `/dev/ttyUSB0`, TCP host or BLE, bot name, etc.) and restart.
3. If the web viewer is enabled in `config.ini`, it is available on port 8080.

## Options

- `timezone`: timezone used by the bot (default `Europe/Paris`).

## Data

- Config: add-on config folder (mounted as `/data/config`)
- Databases, logs, backups: add-on `/data`

Note: config.ini in /root/addon_configs/*_meshcore-bot
