.PHONY: help lint test build openspec-list openspec-validate openspec-view

help:
	@echo "Beschikbare commands (agent-agnostic entrypoints — elke agent/mens roept dezelfde aan):"
	@echo "  make lint              - lint (TODO: vervang door echte command zodra taal gekozen)"
	@echo "  make test              - tests   (TODO: vervang door echte command zodra taal gekozen)"
	@echo "  make build             - build   (TODO: vervang door echte command zodra taal gekozen)"
	@echo "  make openspec-list     - open changes/specs tonen"
	@echo "  make openspec-validate - alle changes/specs valideren"
	@echo "  make openspec-view     - interactief dashboard"

lint:
	@echo "TODO: vervang door echte lint-command"

test:
	@echo "TODO: vervang door echte test-command"

build:
	@echo "TODO: vervang door echte build-command"

openspec-list:
	openspec list

openspec-validate:
	openspec validate --all

openspec-view:
	openspec view
