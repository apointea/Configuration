alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias vim="vim -O"
alias vi="vim"

PATH=~/.brew/bin:$PATH
PATH=~/bin:$PATH

if [ ! -d /tmp/brew_cache ]; then
    mkdir /tmp/brew_cache
fi
if [ ! -d /tmp/brew_tmp ]; then
    mkdir /tmp/brew_tmp
fi
export HOMEBREW_CACHE=/tmp/brew_cache
export HOMEBREW_TMP=/tmp/brew_tmp
