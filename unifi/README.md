# Unifi for hass.io

![Unifi version][unifi-shield]

Unifi controller

## Description

The UniFi Controller allows you to manage your UniFi network using a web browser.

 ## About

This add-on runs Ubiquiti Networks' UniFi Controller software, which allows
you to manage your UniFi network via the web browser. The add-on provides a
single-click installation and run solution for Hass.io, allowing users to get
their network up, running, and updated, easily.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Hass.io add-on.

1. Add repository `https://github.com/lburais/hassio-addons` to your Hass.io instance.
1. Install the "UniFi Controller" add-on.
1. Start the "UniFi Controller" add-on.
1. Check the logs of the "UniFi Controller" to see if everything went well.
1. Click the "OPEN WEB UI" button, and follow the initial wizard.
1. After completing the wizard, log in with the credentials just created.
1. Go to the settings (gears icon in the bottom left) -> Controller (tab).
1. Change the `Controller Hostname/IP` to match the IP or hostname of
   the device running Hass.io.
1. Check the box `Override inform host with controller hostname/IP`.
1. Hit the "Apply Changes" button to activate the settings.
1. Ready to go!

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration, with all available options:

```json
{
    "log_level": "info",
    "ssl": true,
    "certfile": "fullchain.pem",
    "keyfile": "privkey.pem",
    "memory_max": 2048,
    "memory_init": 512
}
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables the use of a custom SSL (HTTPS) certificate with the in UniFi
web interface. Set it `true` to enable it, `false` otherwise.

**Note**: _When leaving this option disabled, UniFi will use a
custom/self-signed SSL certificate._

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default for Hass.io_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default for Hass.io_

### Option: `memory_max`

This option allows you to change the amount of memory the UniFi Controller
is allowed to consume. By default, this is limited to 1 GB. You might want
to increase this, in order to reduce CPU load or reduce this, in order
to optimize your system for lower memory usage.

This option takes the number of Megabyte, for example, the default is 1024.

### Option: `memory_init`

This option allows you to change the amount of memory the UniFi Controller
will initially reserve/consume when starting. By default, this is limited to
512M.

This option takes the number of Megabyte, for example, the default is 512.

## Automated backups

The UniFi Controller ships with an automated backup feature. This feature works
but has been adjusted to put the created backups in a different location.

Backups are created in `/backup/unifi`. You can access this folder using
the normal Hass.io methods (e.g., using Samba, Terminal, SSH).

# <hr>

 _This addon is based on work done by [Hass.IO Add-Ons community][unifi-addons]._

[unifi-shield]: https://img.shields.io/badge/unifi-5.6.42-blue.svg
[unifi-addons]: https://github.com/hassio-addons/addon-unifi/tree/v0.13.3