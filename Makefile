export COMPOSE_MAKE_TARGET = build-with-mkaczanowski-builder-arm

TIMESTAMP = $(shell TZ=US/Pacific date +"%FT%T%z")

export PACKER_LOG = 1
export PACKER_CACHE_DIR = builds/_cache
export PACKER_LOG_PATH = builds/$(TIMESTAMP)/build.log

build:
	COMPOSE_HTTP_TIMEOUT=5 docker-compose up \
	--build \
	--force-recreate \
	--abort-on-container-exit \
	--remove-orphans

build-with-mkaczanowski-builder-arm:
	mkdir -p builds/$(TIMESTAMP)/image
	packer build -var 'output_dir=builds/$(TIMESTAMP)/image' samples/mkaczanowski-builder-arm/raspbian.json

build-with-solo-io-builder-arm:
	mkdir -p builds/$(TIMESTAMP)/image
	packer build -var 'output_dir=builds/$(TIMESTAMP)/image' samples/solo-io-builder-arm/raspbian.json
