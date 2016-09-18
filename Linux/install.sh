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

if [[ $(which vim) == "" || $IGNORE == true ]]; then
	printf "\n$BLUE[*] Install vim$CLEAR"
	sudo apt-get install vim
fi

if [[ $(which wget) == "" || $IGNORE == true ]]; then
	printf "\n$BLUE[*] Install wget$CLEAR"
	sudo apt-get install wget
fi

if [[ $(which zsh) == "" || $IGNORE == true ]]; then
	printf "$BLUE[*] Install zsh$CLEAR"
	sudo apt-get install zsh
fi

if [[ $(which curl) == "" || $IGNORE == true ]]; then
	printf "\n$BLUE[*] Install curl$CLEAR"
	sudo apt-get install curl
fi
