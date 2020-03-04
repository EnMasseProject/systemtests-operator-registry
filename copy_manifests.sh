#!/usr/bin/env bash
id=$(docker create $1)
REGISTRY=${2}
docker cp $id:/manifests $PWD
if [ "${REGISTRY}" != "" ]; then
    find manifests -name "*.yaml" | xargs sed -e "s,registry.redhat.io/amq7/amq-online-,${REGISTRY}/rh-osbs/amq7-amq-online-,g" -i
    find manifests -name "*.yaml" | xargs sed -e "s,registry.redhat.io/amq7-tech-preview/amq-online-,${REGISTRY}/rh-osbs/amq7-tech-preview-amq-online-,g" -i
fi
docker rm -v $id
