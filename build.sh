#!/bin/bash

SCRIPT_NAME=`basename "$0"`

if [[ $# -lt 1 ]]; then
  echo "Usage: $SCRIPT_NAME TOOL_NAME"
  exit 1
fi

TOOL_NAME=$1

ARCH=$(uname -m)
if [[ $ARCH = "x86_64" ]]; then
  # MacOS
  BASE_IMAGE="alpine:3.4"
elif [[ $ARCH = "armv7l" ]]; then
  # RPI
  BASE_IMAGE="arm32v7/alpine:3.12.0"
else
  echo "Unsupported archutecture: $ARCH"
  exit 1
fi

BASE_IMAGE_ARG="--build-arg BASE_IMAGE=$BASE_IMAGE"

docker build \
  -f $TOOL_NAME.Dockerfile \
  -t dt-$TOOL_NAME \
  $(echo $BASE_IMAGE_ARG) \
  .
