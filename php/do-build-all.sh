#!/usr/bin/env bash

source $(dirname "$0")/util-colours.sh

yellow "Initiating build of all images ..."
yellow "This script will take a while!"
newline

(cd php/7.0 && bash do-build.sh)
(cd php/7.1 && bash do-build.sh)
(cd php/7.2 && bash do-build.sh)
