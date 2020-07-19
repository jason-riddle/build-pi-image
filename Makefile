build:
	COMPOSE_HTTP_TIMEOUT=5 docker-compose up \
	--build \
	--force-recreate \
	--abort-on-container-exit \
	--remove-orphans

packer-build:
	PACKER_LOG=1 \
	PACKER_CACHE_DIR=packer_cache \
	PACKER_LOG_PATH=packer_build.log \
	packer build raspbian.json

packer-build-ubuntu:
	PACKER_LOG=1 \
	PACKER_CACHE_DIR=packer_cache \
	PACKER_LOG_PATH=packer_build.log \
	packer build ubuntu-20.04-arm64.json
