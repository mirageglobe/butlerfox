.DEFAULT_GOAL:=help
SHELL:=/bin/bash

##@ Tools

.PHONY: initenv build lint test
# phony is used to make sure theres no similar file such as <target> that cause the make recipie not to work

initenv: 					## preps and checks local development environment
	@echo ":: checking build dependancies ::"
	@echo ":: checking environment variables ::"

build: 						## builds project
	@echo ":: building project ::"

run: 							## runs project
	@echo ":: run project ::"

lint: 						## set up lints using shellcheck
	@echo ":: running lint ::"
	shellcheck src/fox.sh

test: 						## set up tests using bats-core
	@echo ":: running bats-core test(s) ::"
	bats -r test/*

##@ Helpers

.PHONY: help

help:  ## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
