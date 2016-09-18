#! /usr/bin/env bash

# COLORS
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
CLEAR="\033[0m\n"

# SCRIPT DIR
SUB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $(which htop) == "" || $IGNORE == true ]]; then
	printf "\n$BLUE[*] Install htop$CLEAR"
    brew install htop
fi

if [[ $(which wget) == "" || $IGNORE == true ]]; then
	printf "\n$BLUE[*] Install wget$CLEAR"
    brew install wget
fi
