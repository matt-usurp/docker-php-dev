#!/usr/bin/env bash

COLOUR_RED="\033[31m"
COLOUR_GREEN="\033[32m"
COLOUR_YELLOW="\033[33m"
COLOUR_BLUE="\033[34m"
COLOUR_CYAN="\033[36m"
COLOUR_RESET="\033[0m"

newline () {
  echo -e "${@}"
}

red () {
  echo -e "${COLOUR_RED}${@}${COLOUR_RESET}";
}

green () {
  echo -e "${COLOUR_GREEN}${@}${COLOUR_RESET}";
}

yellow () {
  echo -e "${COLOUR_YELLOW}${@}${COLOUR_RESET}";
}

blue () {
  echo -e "${COLOUR_BLUE}${@}${COLOUR_RESET}";
}

cyan () {
  echo -e "${COLOUR_CYAN}${@}${COLOUR_RESET}";
}
