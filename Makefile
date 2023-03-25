linter := protolint
linter_args := -fix

.PHONY: lint
lint:
	$(linter) lint $(linter_args) .
