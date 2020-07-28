#!/usr/bin/env bash
id=$(docker create $1 /bin/bash)
REGISTRY=${2}
docker cp $id:/manifests $PWD
if [[ "${REGISTRY}" != "registry.redhat.io" ]]; then
  echo "REPLACUJU"
  if [[ "${REGISTRY}" != "" ]] && [[ "${REGISTRY}" != "image-registry.openshift-image-registry.svc:5000" ]]; then
      find manifests -name "*.yaml" | xargs sed -e "s,registry.redhat.io/amq7/amq-online-,${REGISTRY}/rh-osbs/amq7-amq-online-,g" -i
      find manifests -name "*.yaml" | xargs sed -e "s,registry.redhat.io/amq7-tech-preview/amq-online-,${REGISTRY}/rh-osbs/amq7-tech-preview-amq-online-,g" -i
  elif [[ "${REGISTRY}" == "image-registry.openshift-image-registry.svc:5000" ]]; then
      find manifests -name "*.yaml" | xargs sed -e "s,registry.redhat.io/amq7/amq-online-,${REGISTRY}/amq-online-images/amq-online-,g" -i
      find manifests -name "*.yaml" | xargs sed -e "s,registry.redhat.io/amq7-tech-preview/amq-online-,${REGISTRY}/amq-online-images/amq-online-,g" -i
  fi
fi
docker rm -v $id
