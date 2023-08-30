#!/usr/bin/make -f

ELIXIR_VER := 1.11
DOCKER_TAG := contrxir_api$(ELIXIR_VER)

.PHONY: docker/build docker/test docker/iex

build:
	docker build --build-arg elixir_ver=$(ELIXIR_VER) .

tests: docker/build
	docker-compose run --rm mix test

console: docker/build
	docker-compose run --rm -it iex -S mix