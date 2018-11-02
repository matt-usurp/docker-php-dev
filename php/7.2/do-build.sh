#!/usr/bin/env bash

source $(dirname "$0")/../util-colours.sh

IMAGE="musurp/php"
IMAGE_DEV="musurp/php-dev"

VERSION_FULL="7.2.11"
VERSION_MINOR="7.2"

green "Targeting php@${VERSION_FULL}"

# Build the production and development versions.
build () {
  newline
  cyan "Building \"${IMAGE}\" @$1"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE}:${VERSION_FULL}-$1" \
    --tag="${IMAGE}:${VERSION_MINOR}-$1" \
    "$1"

  yellow " .. testing."
  docker run -it "${IMAGE}:${VERSION_FULL}-$1" sh -c "$2"

  newline
  cyan "Building \"${IMAGE_DEV}\" @$1"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE_DEV}:${VERSION_FULL}-$1" \
    --tag="${IMAGE_DEV}:${VERSION_MINOR}-$1" \
    "$1/xdebug"

  yellow " .. testing."
  docker run -it "${IMAGE_DEV}:${VERSION_FULL}-$1" sh -c "$2"
}

build "cli" "php -v"
build "fpm" "php-fpm -v"

newline
