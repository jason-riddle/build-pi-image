FROM multiarch/qemu-user-static:register AS register
FROM golang:1.14-buster AS builder

ENV GO111MODULE=on

RUN apt-get update \
    && apt-get install -y --no-install-recommends git

# Install packer plugins
ADD ./third_party/github.com/solo-io/packer-builder-arm-image /go/src/github.com/solo-io/packer-builder-arm-image
RUN cd /go/src/github.com/solo-io/packer-builder-arm-image \
    && go install .

ADD ./third_party/github.com/YaleUniversity/packer-provisioner-goss /go/src/github.com/YaleUniversity/packer-provisioner-goss
RUN cd /go/src/github.com/YaleUniversity/packer-provisioner-goss \
    && go install .

FROM ubuntu:18.04

ARG PACKER_VERSION=1.6.1

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo ca-certificates make qemu-user-static tzdata unzip wget xz-utils

# Install packer
RUN wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip 2>/dev/null \
    && unzip -o /tmp/packer.zip -d /usr/local/bin \
    && rm -f /tmp/packer.zip

# Copy relevant binaries
COPY --from=builder  /go/bin/packer-builder-arm-image /usr/local/bin/packer-builder-arm-image
COPY --from=builder  /go/bin/packer-provisioner-goss /usr/local/bin/packer-provisioner-goss
COPY --from=register /register /register
COPY --from=register /qemu-binfmt-conf.sh /qemu-binfmt-conf.sh

# Prepare workspace
WORKDIR /workspace
