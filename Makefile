
build:
	docker build --build-arg MANIFESTS_IMAGE=${FROM} -t systemtests-operator-registry .