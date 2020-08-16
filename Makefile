BUILD_TIMESTAMP = $(shell TZ=US/Pacific date +"%FT%T%z")
BUILD_CACHE = builds/_cache
BUILD_OUTPUT_DIR = builds/timestamps/$(BUILD_TIMESTAMP)

export PACKER_LOG = 1
export PACKER_CACHE_DIR = $(BUILD_CACHE)
export PACKER_LOG_PATH = $(BUILD_OUTPUT_DIR)/build.log

build:
	COMPOSE_HTTP_TIMEOUT=5 docker-compose up \
	--build \
	--force-recreate \
	--abort-on-container-exit \
	--remove-orphans

build-image:
	mkdir -p $(BUILD_OUTPUT_DIR)/image
	packer build -var 'output_dir=$(BUILD_OUTPUT_DIR)/image' raspbian.json
