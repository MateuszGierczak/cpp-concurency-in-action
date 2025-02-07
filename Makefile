PROJECT_NAME = 'cpp-concurrency-in-action'
DOCKER_CMD = 'bash'

docker: docker-image
	$(Q)docker run --rm --interactive --tty \
	 	$(PROJECT_NAME)

docker-image:
	$(Q)docker build --file Dockerfile --tag $(PROJECT_NAME) \
		. | tee docker-image

docker-clean:
	$(Q)rm docker-image
