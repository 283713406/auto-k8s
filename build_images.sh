#!/bin/bash -xe
MACHINE=`uname -m`

if [ ! ${ARCH} ]; then
  if [ "${MACHINE}" == "x86_64" ]; then
    ARCH=amd64
  elif [ "${MACHINE}" == "aarch64" ]; then
    ARCH=arm64
  else
    echo "Unknown machine" && exit 1
  fi
fi

REGISTRY_PATH="kcc/images/${ARCH}"

IMAGE_PREFIX="registry.kylincloud.org/"$REGISTRY_PATH

IMAGE=$IMAGE_PREFIX/"kcan-installer:v1.0.0"

docker login -u wangqiwei -p Kylin123. $CI_REGISTRY

docker build --build-arg ARCH="${ARCH}" -f Dockerfile.complete -t $IMAGE .

docker push $IMAGE

exit 0
