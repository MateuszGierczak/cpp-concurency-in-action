PROJECT_NAME = 'cpp-concurrency-in-action'

LOCAL_SOURCE_DIR ?= $(abspath .)

docker: docker-image
	$(Q)docker run --rm --interactive --tty \
		--volume $(LOCAL_SOURCE_DIR):/tmp/$(PROJECT_NAME):rw \
	 	$(PROJECT_NAME)

docker-image:
	$(Q)docker build --file Dockerfile --tag $(PROJECT_NAME) \
		. | tee docker-image

docker-clean:
	$(Q)rm docker-image
