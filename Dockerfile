FROM quay.io/openshift/origin-operator-registry:latest

COPY /manifests /manifests

RUN /usr/bin/initializer -m /manifests -o bundles.db
ENTRYPOINT ["/usr/bin/registry-server"]
CMD ["-d", "bundles.db", "-t", "termination.log"]