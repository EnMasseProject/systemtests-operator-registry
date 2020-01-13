build:
	./copy_manifests.sh ${FROM}
	docker build -t ${TAG} .