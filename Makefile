
# menu shortcuts targets
MENU := build test deploy build-core test-core deploy-core test-vagrant

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

# === functions

define fn_check_file_regex
	cat $(1) || grep "$(2)"
endef

define fn_check_command_note
	command -V $(1) || printf "$(2)"
endef

define fn_print_header
	echo "";
	echo "==> $(1)";
	echo "";
endef

define fn_print_header_command
	echo "";
	echo "==> $(1)";
	echo "";
	$(2);
endef

define fn_print_tab
	printf "%s\t\t%s\t\t%s\n" $(1) $(2) $(3)
endef

##@ Tools

# phony is used to make sure there is no similar file such as <target> that cause the make recipe not to work

# core commands

all: 	build test deploy																## build test deploy project
	@echo ":: build test deploy - ok ::"

build: 	build-core																		## build project
	@echo ":: build project - ok ::"

test: 	test-core 																		## test project
	@echo ":: test project - ok ::"

deploy: deploy-core																		## deploy files
	@echo ":: deploy project - ok ::"

# misc commands

run: 																									## runs the main executable or help
	@echo ":: run project main executable or help ::"
	bash src/fox.sh

# helper commands

build-core:
	@$(call fn_print_header,"check build dependancies")
	command -V shellcheck
	command -V bats
	@echo ":: checking environment variables ::"
	@echo "no env variables required"

test-core:
	@$(call fn_print_header,"check test dependancies")
	command -V shellcheck
	command -V bats
	@$(call fn_print_header,"run tests")
	@echo ":: testing project ::"
	bats -r test/*
	@$(call fn_print_header,"run lint")
	shellcheck src/fox.sh

test-vagrant: 																				## spin up vagrant test env
	@$(call fn_print_header,"spin up local test env")
	@echo ":: spin up vagrant for test ::"
	vagrant up

deploy-core:
	@$(call fn_print_header,"build distribution")
	cp src/fox.sh dist/fox-latest.sh
	cp src/.fox.bash dist/.fox.bash
	@$(call fn_print_header,"test distribution")
	command -V dist/fox-latest.sh

##@ Helpers

help:  ## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
