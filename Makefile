

.PHONY: serve
serve:
	cd site && zola serve

.PHONY: build
build:
	cd site && zola build

.PHONY: css
css:
	npm run build:css
