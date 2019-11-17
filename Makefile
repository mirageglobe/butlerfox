
# menu shortcuts targets
MENU := build test deploy

# menu helpers targets
MENU := run help

# load phony
# info - phony is used to make sure there is no similar file(s) such as <target> that cause the make recipe not to work
.PHONY: all clean test $(MENU)

# === variables

# set default target
.DEFAULT_GOAL := help

# # set default shell to use
# SHELL := /bin/bash

# sets all lines in the recipe to be passed in a single shell invocation
# ref - https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.ONESHELL:

##@ Tools

# phony is used to make sure there is no similar file such as <target> that cause the make recipe not to work

# core commands

all: 	build test deploy																## build test deploy project
	@echo ":: build test deploy - ok ::"

build: 	build-init																		## build project
	@echo ":: build project - ok ::"

test: 	test-init test-core test-lint 								## test project
	@echo ":: test project - ok ::"

deploy: deploy-init																		## deploy files
	@echo ":: deploy project - ok ::"

# misc commands

run: 																									## runs the main executable or help
	@echo ":: run project main executable or help ::"
	bash src/fox.sh

# helper commands

build-init:
	@echo ":: checking build dependancies ::"
	command -v shellcheck
	command -v bats
	@echo ":: checking environment variables ::"
	@echo "no env variables required"

test-init:
	@echo ":: check test dependancies ::"
	command -v shellcheck
	command -v bats

test-lint:
	@echo ":: running lint ::"
	shellcheck src/fox.sh

test-core:
	@echo ":: testing project ::"
	bats -r test/*

test-vagrant:
	@echo ":: testing project ::"
	vagrant up

deploy-init:
	@echo ":: deploying binary ::"
	cp src/fox.sh dist/fox-latest.sh
	cp src/.fox.bash dist/.fox.bash
	@echo ":: final test binary ::"
	command -v dist/fox-latest.sh

##@ Helpers

help:  ## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
