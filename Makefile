
VERSION                 ?= $(shell git describe --tags --always --dirty)
RELEASE_VERSION         ?= $(shell git describe --abbrev=0)
DOCKER_REPO				= connctd/idf-build

.PHONY: docker/build docker/push

docker/build:
	docker build \
		--file Dockerfile \
		--rm \
		--tag "$(DOCKER_REPO):latest" \
		--tag "$(DOCKER_REPO):$(VERSION)" .

docker/push:
	docker push "$(DOCKER_REPO):$(VERSION)"
