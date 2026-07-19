# Home assistant add-on: Portainer

![Version](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Flburais%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
![Arch](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Flburais%2Fhassio-addons%2Fmaster%2Fportainer%2Fconfig.json)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/52df50fedb4949569495edeb2ea58827)](https://app.codacy.com/gh/lburais/hassio-addons/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

## About

---

[Portainer CE](https://www.portainer.io/) provides a web interface for Docker environment visibility.

This add-on wraps the official `portainer/portainer-ce:lts` container and persists Portainer data in Home Assistant's `/data` volume.

## Important limitation

Home Assistant add-ons expose Docker access through the `docker_api` add-on permission, which is documented as read-only. Portainer can start and present its UI, but container management actions may be limited or unavailable on Home Assistant OS because the full writable Docker socket is not exposed to add-ons.

## Installation

The installation of this add-on is straightforward and not different in
comparison to installing any other Hass.io add-on.

1. [Add my Hass.io add-ons repository][repository] to your Hass.io instance.
1. Install this add-on.
1. Start the add-on.
1. Open the web UI on port `9443`.
1. Complete the Portainer initial administrator setup.

## Configuration

This add-on does not require configuration options.

Exposed ports:

- `9443/tcp`: Portainer HTTPS web interface
- `8000/tcp`: Edge agent tunnel port

## Data persistence

Portainer stores its state in `/data` inside the container. Home Assistant persists that directory for the add-on automatically.

## Support

Create an issue on the [repository github][repository]

[repository]: https://github.com/lburais/hassio-addons