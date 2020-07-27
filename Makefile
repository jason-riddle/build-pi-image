export PACKER_LOG = 1
export PACKER_CACHE_DIR = packer_cache
export PACKER_LOG_PATH = packer_build.log

build:
	COMPOSE_HTTP_TIMEOUT=5 docker-compose up \
	--build \
	--force-recreate \
	--abort-on-container-exit \
	--remove-orphans

packer-builder-arm:
	packer build packer-builder-arm-samples/raspbian.json

packer-builder-arm-ubuntu:
	packer build packer-builder-arm-samples/ubuntu-20.04-arm64.json
