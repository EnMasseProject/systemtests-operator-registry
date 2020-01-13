
build:
	sed s,\$$MANIFESTS_IMAGE,${FROM},g Dockerfile.template > Dockerfile
	docker build -t ${TAG} .