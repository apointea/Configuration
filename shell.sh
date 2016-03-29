alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias vim="vim -O"
alias vi="vim"
alias gccw="gcc -Wall -Werror -Wextra"
alias g++w="g++ -Wall -Werror -Wextra"

PATH=~/bin:$PATH

OS="`uname`"
case $OS in
  'Linux') #LINUX
    ;;
  'Darwin') #MAC
    PATH=~/.brew/bin:$PATH
    ;;
  *) ;;
esac
