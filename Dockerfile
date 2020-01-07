
ARG MANIFESTS_IMAGE
FROM ${MANIFESTS_IMAGE} AS manifests_image

FROM quay.io/openshift/origin-operator-registry:latest

COPY --from=manifests_image /manifests /manifests

RUN /usr/bin/initializer -m /manifests -o bundles.db
ENTRYPOINT ["/usr/bin/registry-server"]
CMD ["-d", "bundles.db", "-t", "termination.log"]