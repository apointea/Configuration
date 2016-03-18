#! /bin/bash

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

# IGNORE MOD
IGNORE=false
if [[ $# == 1 && $1 == "-i" ]]; then
    IGNORE=true
fi

# FORCE MOD
FORCE=false
if [[ $# == 1 && $1 == "-f" ]]; then
    FORCE=true
fi

printf "\n$BLUE[*] Install vim$CLEAR"
if [[ $(which vim) == "" || $IGNORE == true ]]; then
    sudo apt-get install vim
else
  printf "$YELLOW[!] WARNING vim already installed$CLEAR"
fi

printf "\n$BLUE[*] Install wget$CLEAR"
if [[ $(which wget) == "" || $IGNORE == true ]]; then
    sudo apt-get install wget
else
  printf "$YELLOW[!] WARNING wget already installed$CLEAR"
fi

printf "$BLUE[*] Install zsh$CLEAR"
if [[ $(which zsh) == "" || $IGNORE == true ]]; then
    sudo apt-get install zsh
else
  printf "$YELLOW[!] WARNING zsh already installed$CLEAR"
fi
