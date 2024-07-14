.DEFAULT_GOAL := help

REPOSITORY := $(notdir $(CURDIR))

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build slide
build: dist/index.html

.PHONY: pdf
pdf: ## Export PDF
pdf: slides-export.pdf

.PHONY: ppt
ppt: ## Export PPT
ppt: slides-export.pptx

.PHONY: dev
dev: ## Run dev server
dev: node_modules
	npm run dev

dist/index.html: node_modules slides.md
	npm run build

slides-export.pdf: node_modules slides.md
	npm run export

slides-export.pptx: node_modules slides.md
	npm run export -- --format pptx

slides-export-notes.pdf: node_modules slides.md
	npm run export-notes

node_modules: package.json package-lock.json
	npm ci

.PHONY: install
install: ## Install packages
install: node_modules

.PHONY: upgrade
upgrade: ## Upgrades package.json
upgrade:
	npx -p npm-check-updates  -c "ncu -u"
	npm update

.textlintcache: slides.md
	npx textlint --cache slides.md

.PHONY: lint
lint: ## Run textlint
lint: .textlintcache

.PHONY: publish
publish: ## Publish slide
publish: slides-export.pdf slides-export-notes.pdf
	npx -p @slidev/cli -c "slidev build --base /$(REPOSITORY) --out docs"
	npx -p @slidev/cli -c "slidev export --timeout 60000 --format png --output docs/thumbnail"

.PHONY: clean
clean: ## Delete slide
clean:
	rm -rf docs dist slides-export slides-export.pdf slides-export.pptx slides-export-notes.pdf export-notes

.PHONY: init
init: ## Initialize
init:
	npm version v0.0.1 --no-git-tag-version
	npm install
	echo "# Changelog" > CHANGELOG.md
