alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias vim="vim -O"
alias vi="vim"

PATH=~/.brew/bin:$PATH
PATH=~/bin:$PATH

mkdir /tmp/brew_cache
mkdir /tmp/brew_tmp
export HOMEBREW_CACHE=/tmp/brew_cache
export HOMEBREW_TMP=/tmp/brew_tmp
