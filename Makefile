export COMPOSE_MAKE_TARGET = build-with-mkaczanowski-builder-arm

export PACKER_LOG = 1
export PACKER_CACHE_DIR = packer_cache
export PACKER_LOG_PATH = packer_build.log

build:
	COMPOSE_HTTP_TIMEOUT=5 docker-compose up \
	--build \
	--force-recreate \
	--abort-on-container-exit \
	--remove-orphans

build-with-mkaczanowski-builder-arm:
	packer build samples/mkaczanowski-builder-arm/raspbian.json

build-with-solo-io-builder-arm:
	packer build samples/solo-io-builder-arm/raspbian.json
