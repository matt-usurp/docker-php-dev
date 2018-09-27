#!/usr/bin/env bash

source $(dirname "$0")/../util-colours.sh

IMAGE="musurp/php"
IMAGE_DEV="musurp/php-dev"

VERSION_FULL="7.0.32"
VERSION_MINOR="7.0"

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

TYPE="cli"
push_repo "${TYPE}" "${IMAGE}"
push_repo "${TYPE}" "${IMAGE_DEV}"

TYPE="fpm"
push_repo "${TYPE}" "${IMAGE}"
push_repo "${TYPE}" "${IMAGE_DEV}"

newline
