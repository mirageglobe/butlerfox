.PHONY: SHELL test clean all
.DEFAULT_GOAL:=help
SHELL:=/bin/bash

##@ Tools

.PHONY: build test deploy
# phony is used to make sure theres no similar file such as <target> that cause the make recipie not to work

# core commands

build: build-init											## build project
	@echo ":: build project - ok ::"

test: test-suite test-lint 						## test project
	@echo ":: test project - ok ::"

deploy: 															## deploy files
	@echo ":: deploy project - ok ::"

# helper commands

build-init: 													## preps and checks local development environment
	@echo ":: checking build dependancies ::"
	command -v shellcheck
	command -v bats
	@echo ":: checking environment variables ::"

test-suite: 													## test project
	@echo ":: testing project ::"
	bats -r test/*

test-lint: 														## set up lints using shellcheck
	@echo ":: running lint ::"
	shellcheck src/fox.sh

# misc commands

run: 																	## runs project
	@echo ":: run project ::"

##@ Helpers

.PHONY: help

help:  ## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
