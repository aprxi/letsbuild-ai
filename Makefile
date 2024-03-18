
NAME := letsbuild-ai

.PHONY: serve
serve:
	zola -r site serve

.PHONY: build
build:
	zola -r site build

.PHONY: css
css:
	npm run build:css

.PHONY: docker
docker:
	docker build -t $(NAME) .
	docker run -ti -p 1111:1111 --rm $(NAME)
