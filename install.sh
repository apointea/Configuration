!# /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get install wget
sudo apt-get install zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp $DIR/zshrc ~/.zshrc
cp $DIR/shell.sh ~/.shell.sh
cp $DIR/custom.zsh-theme ~/.oh-my-zsh/themes/
cp -r $DIR/bin ~/bin
