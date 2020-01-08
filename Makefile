
build:
	docker build --build-arg MANIFESTS_IMAGE=${FROM} -t ${TAG} .