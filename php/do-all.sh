#!/usr/bin/env bash

source $(dirname "$0")/util-colours.sh

yellow "Initiating build & push of all images ..."
yellow "This script takes roughly 10 minutes!"
newline

bash php/do-build-all.sh
bash php/do-push-all.sh
