build:
	./copy_manifests.sh ${FROM} ${REGISTRY}
	docker build -t ${TAG} .
