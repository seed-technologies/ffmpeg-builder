# Makefile
# help:
#    all)
#    make --always-make
.DEFAULT_GOAL := help
MAKEFILE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

.PHONY: help
help:
	@echo "\n>> help [ command list ]"
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@grep -E '^.PHONY: [a-zA-Z_-]+.*?##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = " "}; {printf "\033[35m%-30s\033[32m %s\n", $$2, $$4}'
	@echo ""

.PHONY: build_android ## [category]`description`.
build_android:
	cd lib/mobile/mobile-ffmpeg && ./android.sh

.PHONY: build_ios ## [category]`description`.
build_ios:
	cd lib/mobile/mobile-ffmpeg && ./ios.sh

.PHONY: build_standalone ## [category]`description`.
build_standalone:
	cd lib/standalone/FFmpeg  && \
		./configure && \
		make && make install
	
.PHONY: build_all ## [category]`description`.
build_all: build_standalone build_ios build_android
	@echo 'completed all build process'
	
