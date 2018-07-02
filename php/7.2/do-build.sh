#!/usr/bin/env bash

source $(dirname "$0")/../util-colours.sh

IMAGE="musurp/php"
IMAGE_DEV="musurp/php-dev"

VERSION_FULL="7.2.7"
VERSION_MINOR="7.2"

green "Targeting php@${VERSION_FULL}"

# Build the production and development versions.
build () {
  newline
  cyan "Building \"${IMAGE}\" @${TYPE}"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE}:${VERSION_FULL}-${TYPE}" \
    --tag="${IMAGE}:${VERSION_MINOR}-${TYPE}" \
    "${TYPE}"

  yellow " .. testing."
  docker run -it "${IMAGE}:${VERSION_FULL}-${TYPE}" sh -c "${TEST}"

  newline
  cyan "Building \"${IMAGE_DEV}\" @${TYPE}"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE_DEV}:${VERSION_FULL}-${TYPE}" \
    --tag="${IMAGE_DEV}:${VERSION_MINOR}-${TYPE}" \
    "${TYPE}/xdebug"

  yellow " .. testing."
  docker run -it "${IMAGE_DEV}:${VERSION_FULL}-${TYPE}" sh -c "${TEST}"
}

TYPE="cli"
TEST="php -v"
build

TYPE="fpm"
TEST="php-fpm -v"
build

newline
