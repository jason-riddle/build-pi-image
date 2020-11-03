# Build Raspberry Pi Images

Build Raspberry Pi images with Docker.

The goal of this project is to automate building Raspberry Pi images. The built
image has ssh enabled and runs a [goss](https://github.com/aelsabbahy/goss) test.
to validate. This repo can be forked and tailored for other needs.

## Requirements

- docker
- docker-compose

## Build with Packer

Checkout git submodules.

```sh
git submodule update --init --recursive
```

Build Raspberry Pi Image and place built image in `builds/$TIMESTAMP/image/`.

```sh
make build
```

[Etcher](https://www.balena.io/etcher) or [Raspberry Pi Imager](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility)
can be used for burning the image to an SD card.

### [Work in progress] Boot and Validate with Vagrant

Download a kernel.

```sh
wget -nc https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.4.34-jessie
```

Start vagrant virtual machine.

```sh
vagrant up
vagrant ssh
```

Boot with qemu.

```sh
BUILD_TIMESTAMP="2020-08-16T15:18:11-0700"
export KERNEL="/vagrant/kernel-qemu-4.4.34-jessie"
export IMAGE="/vagrant/builds/timestamps/${BUILD_TIMESTAMP}/image/raspbian-buster-lite.img"

/vagrant/boot.sh
```
