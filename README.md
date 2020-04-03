# Packer Build: Raspbian OS

Build a custom Raspbian OS image using Docker, Packer, and [packer-builder-arm](https://github.com/mkaczanowski/packer-builder-arm).

Since enabling SSH on the raspbian requires creating the `/boot/ssh` file, I
have automated doing this with packer. Additional customizations are possible
and I suggest you fork this repo and make your own changes.

## Requirements

- docker
- docker-compose

## Usage

Build with

```
make build
```

Once finished, the `raspberry-pi.img` artifact can be burned to an SD card. I
use [etcher](https://www.balena.io/etcher) for burning.
