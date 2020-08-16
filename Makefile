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

build-image:
	mkdir -p builds/$(TIMESTAMP)/image
	packer build -var 'output_dir=builds/$(TIMESTAMP)/image' raspbian.json
