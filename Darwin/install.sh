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

printf "\n$BLUE[*] Install htop$CLEAR"
if [[ $(which htop) == "" || $IGNORE == true ]]; then
    brew install htop
else
  printf "$YELLOW[!] WARNING htop already installed$CLEAR"
fi
