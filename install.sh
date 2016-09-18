#! /usr/bin/env bash

# COLORS
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
BRED="\033[1;31m"
BGREEN="\033[1;32m"
BYELLOW="\033[1;33m"
BBLUE="\033[1;34m"
BMAGENTA="\033[1;35m"
BCYAN="\033[1;36m"
CLEAR="\033[0m"

# SCRIPT DIR
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# IGNORE MOD
IGNORE=false
if [[ $# == 1 && ($1 == "-i" || $2 == "-i") ]]; then
	IGNORE=true
fi

printf "\n$MAGENTA----- OS specific install -----$CLEAR"
OS="`uname`"
printf "\n$GREEN[+] Os detected : $OS$CLEAR"
case $OS in
  'Linux') #LINUX
	source $DIR/$OS/install.sh
	;;
  'Darwin') #MAC
	source $DIR/$OS/install.sh
	;;
  *)
	printf  "$YELLOW[!] no specific configuration for this os$CLEAR"
	;;
esac

printf "\n$MAGENTA----- General install -----$CLEAR"

printf "\n$BLUE[*] Install oh-my-zsh$CLEAR"
if [[ ! -d $HOME/.oh-my-zsh || $IGNORE == true ]]; then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
	printf "$YELLOW[!] WARNING oh-my-zsh already installed$CLEAR"
fi

printf "\n$BLUE[*] Add custom.zsh-theme$CLEAR"
if [[ -d $HOME/.oh-my-zsh/themes/ || $IGNORE == true ]]; then
	cp $DIR/custom.zsh-theme $HOME/.oh-my-zsh/themes/
	printf "$GREEN[+] success $CLEAR"
else
	printf "$RED[-] ERROR no ~/.oh-my-zsh/themes/ directory $CLEAR"
fi

printf "\n$BLUE[*] Replace ~/.zshrc$CLEAR"
cp $DIR/zshrc $HOME/.zshrc

printf "\n$BLUE[*] Replace ~/.shell.sh with $OS version$CLEAR"
rm $HOME/.shell.sh
cat $DIR/shell.sh > $HOME/.shell.sh
cat $DIR/$OS/shell.sh >> $HOME/.shell.sh

printf "\n$BLUE[*] Add bin directory to home$CLEAR"
if [ ! -d $HOME/bin ]; then
	cp -r $DIR/bin $HOME/bin
	printf "$GREEN[+] success $CLEAR"
	printf "$BLUE[*] copy OS specific bin$CLEAR"
	cp -r $DIR/$OS/bin/* $HOME/bin
elif [ $IGNORE == true ]; then
	rm -rf $HOME/bin
	cp -r $DIR/bin $HOME/bin
	printf "$GREEN[+] success $CLEAR"
	printf "$BLUE[*] copy OS specific bin$CLEAR"
	cp -r $DIR/$OS/bin/* $HOME/bin
else
	printf "$YELLOW[!] WARNING ~/bin directory already exist$CLEAR"
fi

printf "\n$BLUE[*] Set zsh as default shell$CLEAR"
chsh -s `which zsh`
