GO ?= go

.DEFAULT: helm-docs

# Read .env file and export the vars
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# ====================================================================================
# Makefile helper functions for helm-docs: https://github.com/norwoodj/helm-docs
#

HELM_DOCS_VERSION := v1.11.0
HELM_DOCS := helm-docs
HELM_DOCS_REPO := github.com/norwoodj/helm-docs/cmd/helm-docs

bin-$(HELM_DOCS): ## Installs helm-docs
	@GO111MODULE=on $(GO) install $(HELM_DOCS_REPO)@$(HELM_DOCS_VERSION)

.PHONY: helm-docs
helm-docs: bin-$(HELM_DOCS) ## Use helm-docs to generate documentation from helm charts
	for dir in $(shell find charts -mindepth 1 -maxdepth 1 -type d); do \
		echo "Generating docs for $$dir"; \
		$(HELM_DOCS) -c $$dir \
			-o README.md \
			-t README.gotmpl.md \
			-t _templates.gotmpl; \
	done
