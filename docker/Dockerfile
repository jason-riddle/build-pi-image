FROM multiarch/qemu-user-static:register AS register
FROM golang:1.13-buster AS builder

ENV GO111MODULE=on

# Install git
RUN apt-get update \
    && apt-get install -y --no-install-recommends git

# Build packer-builder-arm
RUN go get -d github.com/mkaczanowski/packer-builder-arm \
    && go install github.com/mkaczanowski/packer-builder-arm

FROM ubuntu:18.04

ARG PACKER_VERSION=1.5.5

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo ca-certificates make wget unzip qemu-user-static

# Install packer
RUN wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip 2>/dev/null \
    && unzip -o /tmp/packer.zip -d /usr/local/bin \
    && rm -f /tmp/packer.zip

# Copy relevant binaries
COPY --from=builder  /go/bin/packer-builder-arm /usr/local/bin/packer-builder-arm
COPY --from=register /register /register
COPY --from=register /qemu-binfmt-conf.sh /qemu-binfmt-conf.sh

# Prepare workspace
WORKDIR /workspace
