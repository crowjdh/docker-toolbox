#!/bin/bash

TOOL_NAME=$1
# BASE_IMAGE=$2

ARCH=$(uname -m)
if [[ $ARCH = "x86_64" ]]; then
  # MacOS
  BASE_IMAGE="alpine:3.4"
elif [[ $ARCH = "armv7l" ]]; then
  # RPI
  BASE_IMAGE="arm32v7/alpine:3.4"
else
  echo "Unsupported archutecture: $ARCH"
  exit 1
fi

BASE_IMAGE_ARG="--build-arg BASE_IMAGE=$BASE_IMAGE"

# if [[ -z "${BASE_IMAGE}" ]]; then
#   BASE_IMAGE_ARG=""
# else
#   BASE_IMAGE_ARG="--build-arg BASE_IMAGE=$BASE_IMAGE"
# fi

docker build \
  -f $TOOL_NAME.Dockerfile \
  -t dt-$TOOL_NAME \
  $(echo $BASE_IMAGE_ARG) \
  .
