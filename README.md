# Packer Build: Raspberry Pi Image

Build Raspberry Pi images using Docker and Packer.

Enabling SSH on raspbian requires creating a `/boot/ssh` file. `raspbian.json`
creates the file and a [goss](https://github.com/aelsabbahy/goss) test
validates it exists.

## Requirements

- docker
- docker-compose

## Usage

Checkout git submodules.

```sh
git submodule update --init --recursive
```

Build Raspberry Pi Image and place image in `artifacts/`.

```sh
make build
```

[Etcher](https://www.balena.io/etcher) or [Raspberry Pi Imager](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility)
can be used for burning the image to an SD card.
