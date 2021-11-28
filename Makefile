
# helpers
MENU += help readme

# main
MENU := build build-alpine test deploy vagrant-testenv

# defaults
.PHONY: all clean test $(MENU)

# === variables

# set default target
.DEFAULT_GOAL := help

# sets all lines in the recipe to be passed in a single shell invocation
.ONESHELL:

# === helper functions

define fn_print_header
	echo "";
	echo "==> $(1)";
	echo "";
endef

##@ Helpers

help:														## display this help
	@awk 'BEGIN { FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"; } \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2; } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5); } \
		END { printf ""; }' $(MAKEFILE_LIST)

readme:													## show information and notes
	# === information and notes
	@touch README.md
	@cat README.md


##@ Menu

# core commands

all: 	build test deploy					## build test deploy project
	@echo ":: build test deploy - ok ::"

build: 													## build project
	@echo ":: check dependancies ::"
	command -V shellcheck
	command -V bats
	@echo ":: checking environment variables ::"
	@echo "no env variables required"

build-alpine:										## builds alpine docker container
	@echo ":: build alpine container :: output as butlerfox-hound"
	docker build -f ./src/hound-docker/Dockerfile -t butlerfox-hound .
	@echo "to run container use : docker run butlerfox-hound"
	@echo "to run interactive container and publish to host port use : docker run -p 127.0.0.1:8080:8080 -it butlerfox-hound bash"

test: 													## test project
	@echo ":: check dependancies ::"
	command -V shellcheck
	command -V bats
	@echo ":: run test ::"
	bats -r test/*
	@echo ":: run lint ::"
	shellcheck src/fox-sh/fox.sh

deploy: 												## build to distribution folder
	@echo ":: build to dist folder ::"
	cp src/fox-sh/fox.sh dist/fox-latest.sh
	cp src/fox-sh/.fox.bash dist/.fox.bash
	@echo ":: test distribution dist/fox-latest.sh ::"
	command -V dist/fox-latest.sh

# misc commands

run: 														## runs the main executable or help
	@echo ":: run project main executable or help ::"
	bash dist/fox-latest.sh

# helper commands

vagrant-testenv: 								## spin up vagrant test environment
	@$(call fn_print_header,"spin up local test env")
	command -V vagrant
	vagrant plugin install vagrant-vbguest
	vagrant up
