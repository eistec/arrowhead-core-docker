#!/bin/sh

IMAGE_TAG_PREFIX=eistec/arrowhead-
DIRS=service-registry

# Build for x86
for d in ${DIRS}; do
    (cd "${d}" && docker build -t "${IMAGE_TAG_PREFIX}${d}" . && docker push "${IMAGE_TAG_PREFIX}${d}")
done

# Build for ARM (requires binfmt-misc support and a qemu-arm-wrapper)
for d in ${DIRS}; do
    (cd "${d}" && docker build -t "${IMAGE_TAG_PREFIX}${d}:armv7" -f Dockerfile.armv7 . && docker push "${IMAGE_TAG_PREFIX}${d}:armv7")
done
