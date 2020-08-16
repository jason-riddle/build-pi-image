#!/bin/bash

# Disable audio
export QEMU_AUDIO_DRV=none

# 'mon:stdio' captures Ctrl+C, while 'stdio' does not.
SERIAL_DEVICE='stdio'

: "${KERNEL?Need to set KERNEL environment variable}"
: "${IMAGE?Need to set IMAGE environment variable}"

qemu-system-arm \
  -nographic \
  -kernel "$KERNEL" \
  -cpu arm1176 \
  -m 256 \
  -M versatilepb \
  -serial "$SERIAL_DEVICE" -monitor null \
  -append "root=/dev/sda2 rootfstype=ext4 rw console=ttyAMA0 loglevel=8 panic=1" \
  -drive "file=$IMAGE,index=0,media=disk,format=raw"
