#!/usr/bin/env bash

source $(dirname "$0")/../util-colours.sh

IMAGE="musurp/php"
IMAGE_DEV="musurp/php-dev"

VERSION_FULL="7.1.30"
VERSION_MINOR="7.1"

green "Targeting php@${VERSION_FULL}"

# Build the language versions.
build () {
  TAG="$1"

  newline
  cyan "Building \"${IMAGE}\" @${TAG}"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE}:${VERSION_FULL}-${TAG}" \
    --tag="${IMAGE}:${VERSION_MINOR}-${TAG}" \
    "$1"

  yellow " .. testing."
  docker run -it "${IMAGE}:${VERSION_FULL}-${TAG}" sh -c "$2"

  newline
  cyan "Building \"${IMAGE_DEV}\" @${TAG}"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE_DEV}:${VERSION_FULL}-${TAG}" \
    --tag="${IMAGE_DEV}:${VERSION_MINOR}-${TAG}" \
    "$1/xdebug"

  yellow " .. testing."
  docker run -it "${IMAGE_DEV}:${VERSION_FULL}-${TAG}" sh -c "$2"
}

build "cli" "php -v"
build "fpm" "php-fpm -v"

# Build the supervisor versions.
supervisor () {
  TAG="$1-supervisor"

  newline
  cyan "Building \"${IMAGE}\" @${TAG}"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE}:${VERSION_FULL}-${TAG}" \
    --tag="${IMAGE}:${VERSION_MINOR}-${TAG}" \
    "$1/supervisor"

  yellow " .. testing."
  docker run -it --entrypoint "/bin/sh" "${IMAGE}:${VERSION_FULL}-${TAG}" -c "$2"

  newline
  cyan "Building \"${IMAGE_DEV}\" @${TAG}"
  docker build \
    -q \
    --compress \
    --tag="${IMAGE_DEV}:${VERSION_FULL}-${TAG}" \
    --tag="${IMAGE_DEV}:${VERSION_MINOR}-${TAG}" \
    "$1/xdebug/supervisor"

  yellow " .. testing."
  docker run -it --entrypoint "/bin/sh" "${IMAGE_DEV}:${VERSION_FULL}-${TAG}" -c "$2"
}

supervisor "cli" "php -v && printf \"Supervisor \" && supervisord -v"

newline
