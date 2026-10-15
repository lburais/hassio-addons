# MeshCore Bot add-on

Runs [meshcore-bot](https://github.com/agessaman/meshcore-bot) (image `ghcr.io/agessaman/meshcore-bot`).

## Setup

1. Start the add-on once: it creates `config.ini` in the add-on config folder (`/addon_configs/<slug>_meshcore-bot/`).
2. Edit `config.ini` (serial port such as `/dev/ttyUSB0`, TCP host or BLE, bot name, etc.) and restart.
3. If the web viewer is enabled in `config.ini`, it is available on port 7777.

All settings are read from `config.ini`; the add-on has no separate options. The default template is stored in `config/config.ini` in the repository and copied to the Home Assistant add-on config folder on first start if no config file exists there.

## Data

- Config: add-on config folder (mounted as `/data/config`)
- Databases, logs, backups: add-on `/data`

Note: config.ini in /root/addon_configs/*_meshcore-bot
