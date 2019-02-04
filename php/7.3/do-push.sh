#!/usr/bin/env bash

source $(dirname "$0")/../util-colours.sh

IMAGE="musurp/php"
IMAGE_DEV="musurp/php-dev"

VERSION_FULL="7.3.1"
VERSION_MINOR="7.3"

green "Pushing php@${VERSION_FULL}"
newline

# Push a version tag.
push () {
  cyan "### $1"
  docker push "$1"
  newline
}

# Push a group of tags.
push_repo () {
  push "$2:${VERSION_FULL}-$1"
  push "$2:${VERSION_MINOR}-$1"
}

TAG="cli"
push_repo "${TAG}" "${IMAGE}"
push_repo "${TAG}" "${IMAGE_DEV}"

TAG="fpm"
push_repo "${TAG}" "${IMAGE}"
push_repo "${TAG}" "${IMAGE_DEV}"

TAG="cli-supervisor"
push_repo "${TAG}" "${IMAGE}"
push_repo "${TAG}" "${IMAGE_DEV}"

newline
