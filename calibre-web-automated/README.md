# Home assistant add-on: Calibre-Web Automated

![Version](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Flburais%2Fhassio-addons%2Fmaster%2Fcalibre-web-automated%2Fconfig.json)
![Arch](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Flburais%2Fhassio-addons%2Fmaster%2Fcalibre-web-automated%2Fconfig.json)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/52df50fedb4949569495edeb2ea58827)](https://app.codacy.com/gh/lburais/hassio-addons/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

## About

---

[Calibre-Web Automated](https://github.com/crocodilestick/Calibre-Web-Automated) is a Calibre-Web based ebook library manager with ingest, conversion, metadata, and automation features.

This add-on wraps the official `crocodilestick/calibre-web-automated:latest` image and maps Home Assistant storage into the paths the container expects.

## Storage layout

The add-on mounts three writable paths:

- `/config`: add-on configuration and Calibre-Web Automated application data
- `/cwa-book-ingest`: import folder watched for new books
- `/calibre-library`: Calibre library root containing `metadata.db`

In Home Assistant these paths map to:

- `/addon-config` from the add-on config storage
- `/share` from the Home Assistant `share` folder
- `/media` from the Home Assistant `media` folder

The effective CWA paths are controlled by options and linked at startup:

- `/config` -> `CONFIG_PATH`
- `/cwa-book-ingest` -> `INGEST_PATH`
- `/calibre-library` -> `LIBRARY_PATH`

The add-on startup script also exports `TZ`, `PUID`, `PGID`, and the CWA path options before launching the app process.

Anything dropped into `/cwa-book-ingest` is processed and removed by Calibre-Web Automated after import.

## Installation

The installation of this add-on is straightforward and not different in
comparison to installing any other Hass.io add-on.

1. [Add my Hass.io add-ons repository][repository] to your Hass.io instance.
1. Install this add-on.
1. Adjust the options if needed.
1. Start the add-on.
1. Open the web UI on port `8083`.
1. Log in with the upstream default credentials `admin` / `admin123` and change them.

## Configuration

```yaml
TZ: Europe/Paris
PUID: 501
PGID: 20
CONFIG_PATH: /addon-config
INGEST_PATH: /share/calibre-web-automated/ingest
LIBRARY_PATH: /media/calibre-web-automated/library
NETWORK_SHARE_MODE: false
TRUSTED_PROXY_COUNT: 1
DISABLE_LIBRARY_AUTOMOUNT: false
```

Notes:

- Set `NETWORK_SHARE_MODE` to `true` if your library is on SMB or NFS storage.
- `TRUSTED_PROXY_COUNT` is useful when you run the add-on behind multiple reverse proxies.
- `CONFIG_PATH` can be under `/addon-config`, `/share`, or `/media`.
- `INGEST_PATH` and `LIBRARY_PATH` can be set to directories under `/share` or `/media`.
- If you use Calibre plugins, place them under `/config/.config/calibre/plugins` inside the add-on config storage and also copy `customize.py.json` into `/config/.config/calibre/`.

## Support

Create an issue on the [repository github][repository]

[repository]: https://github.com/lburais/hassio-addons