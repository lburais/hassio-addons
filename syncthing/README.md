# Syncthing for hass.io

![sSyncthing version][syncthing-shield]

Share your configuration using syncthing network file sharing.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## Description

This addon provide a [syncthing](https://syncthing.net/) container for hass.io.

> Syncthing replaces proprietary sync and cloud services with something open, trustworthy and decentralised. Your data is your data alone and you deserve to choose where it is stored, if it is shared with some third party and how it's transmitted over the Internet.

When creating a new folder with the webui, you must set the folder path to something that will be persistent in case of container reboot/upgrade. You can use any of the following path :

 - `/data/<subfolder/path>` : `subfolder/path` will be created in the addon persistent volume,
 - `/data/<subfolder/path>` : `subfolder/path` will be created in the share directory, which can be accessed with samba,
 - `/config` : to synchronize home assistant configuration,
 - `/backup` : to synchronize home assistant backups,
 - `/addons` :  to synchronize hassio addons,
 - `/ssl   ` :  to synchronize home assistant backups.

 ## Configuration
 There are no configuration options.

 <hr>

 _This addon is based on work done by [bestlibre](https://github.com/bestlibre/hassio-addons/tree/master/syncthing)._

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[syncthing-shield]: https://img.shields.io/badge/syncthing-${SYNCTHING_VERSION}-lightgrey.svg