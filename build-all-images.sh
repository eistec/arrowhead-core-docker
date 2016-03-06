#!/bin/sh

IMAGE_TAG_PREFIX=eistec/arrowhead-
DIRS=service-registry

# Build for x86
for d in ${DIRS}; do
    (cd "${d}" && docker build -t "${IMAGE_TAG_PREFIX}${d}:latest" . && docker push "${IMAGE_TAG_PREFIX}${d}:latest")
done

# Build for ARM (requires binfmt-misc support and a qemu-arm-wrapper)
for d in ${DIRS}; do
    (cd "${d}" && docker build -t "${IMAGE_TAG_PREFIX}${d}:armhf" -f Dockerfile.armhf . && docker push "${IMAGE_TAG_PREFIX}${d}:armhf")
done
