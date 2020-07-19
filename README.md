# Packer Build: Raspberry Pi Image

Build Raspberry Pi images using Docker, Packer, and [packer-builder-arm](https://github.com/mkaczanowski/packer-builder-arm).

Enabling SSH on raspbian requires creating a `/boot/ssh` file. `raspbian.json`
creates the file and a [goss](https://github.com/aelsabbahy/goss) test
validates it exists.

Also included is `ubuntu-20.04-arm64.json` for building an ubuntu image. This
may be broken and welcome PRs with fixes.

## Requirements

- docker
- docker-compose

## Usage

Checkout `packer-builder-arm` submodule.

```sh
git submodule update --init --recursive
```

Build `raspbian.img`

```sh
make build
```

The `raspbian.img` artifact can be burned to an SD card. I
use [etcher](https://www.balena.io/etcher) for burning.

## Bonus: Configuration Management with Ansible

Can be paired with https://github.com/jason-riddle/ansible-hashistack-bramble
for managing multiple Raspberry Pis.
