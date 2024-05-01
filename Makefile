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
	$(HELM_DOCS) -c charts/fivenet \
		-o README.md \
		-t README.gotmpl.md \
		-t _templates.gotmpl
