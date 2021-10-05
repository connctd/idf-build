
VERSION                 ?= $(shell git describe --tags --always --dirty)
RELEASE_VERSION         ?= $(shell git describe --abbrev=0)
DOCKER_REPO				= connctd/build-idf

.PHONY: docker/build docker/push

docker/build: $(PROJECT_NAME)_linux_amd64
	docker build \
		--file Dockerfile \
		--rm \
		--tag "$(DOCKER_REPO):$(VERSION)" .

docker/push: docker
	docker push "$(DOCKER_REPO):$(VERSION)"
