#! /usr/bin/env bash

# @Author: Antoine Pointeau <kalif>
# @Date:   2016-09-19T00:46:29+02:00
# @Email:  web.pointeau@gmail.com
# @Filename: install.sh
# @Last modified by:   kalif
# @Last modified time: 2017-05-18T01:10:27+02:00

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
CLEAR="\033[0m\n"

# SCRIPT DIR
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# REJECT ALL NON-LINUX
OS="`uname`"
if [[ $OS != "Linux" ]]; then
    printf "$RED[-] Configuration only for Linux users$CLEAR"
    exit 1
fi


# INSTALL `lsb_release` IF NOT BY DEFAULT
sudo yum install redhat-lsb -y > /dev/null 2>&1
sudo apt-get install lsb-release -y > /dev/null 2>&1


# CONFIGURE VARS RELATIVE TO THE DISTRIBUTION
DISTRIB="`lsb_release -is`"
case $DISTRIB in
    'Debian')
        PKG='apt-get'
        ;;
    'CentOS')
        PKG='yum'
        ;;
    *)
        printf  "$RED[-] No package manager pre-set for this distrib$CLEAR"
        exit 1
        ;;
esac


# INSTALL 'system-refresh.sh'
printf "$BLUE[*] Install system auto refresh$CLEAR"
sudo cp $DIR/scripts/system-refresh.sh /sbin/system-refresh.sh
sudo echo "0 4 * * 7 root /sbin/system-refresh.sh $PKG" >> /etc/cron.d/system-refresh
printf "$GREEN[+] DONE$CLEAR"


# REFRESH SYSTEM
printf "$BLUE[*] Refresh system packages$CLEAR"
sudo /sbin/system-refresh.sh $PKG
printf "$GREEN[+] DONE$CLEAR"

# INSTALL COMMON PACKAGES
COMMONS="vim wget zsh curl unzip"
printf "$BLUE[*] Install common packages$CLEAR"
sudo $PKG install -y $COMMONS
printf "$GREEN[+] DONE$CLEAR"

# INSTALL oh-my-zsh
printf "$BLUE[*] Install oh-my-zsh$CLEAR"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
printf "$GREEN[+] DONE$CLEAR"
printf "$BLUE[*] Add custom oh-my-zsh theme$CLEAR"
cp $DIR/res/custom.zsh-theme $HOME/.oh-my-zsh/themes/
printf "$BLUE[*] Replace zshrc$CLEAR"
cp $DIR/res/zshrc $HOME/.zshrc
printf "$BLUE[*] Replace default shell$CLEAR"
cp -r $DIR/sbin $HOME/sbin
chsh -s /bin/zsh
