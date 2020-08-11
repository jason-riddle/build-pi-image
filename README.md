# Packer Build: Raspberry Pi Image

Build Raspberry Pi images using Docker and Packer.

The goal of this project is to automate building Raspberry Pi images. The built
image has ssh enabled and runs a [goss](https://github.com/aelsabbahy/goss) test.
to validate. This repo can be forked and tailored for other needs.

## Requirements

- docker
- docker-compose

## Usage

Checkout git submodules.

```sh
git submodule update --init --recursive
```

Build Raspberry Pi Image and store built image in `out/packer_artifacts/`.

```sh
make build
```

[Etcher](https://www.balena.io/etcher) or [Raspberry Pi Imager](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility)
can be used for burning the image to an SD card.
