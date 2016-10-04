export PATH=~/.brew/bin:$PATH
export PATH=/Applications/Atom.app/Contents/MacOS:$PATH

if [ ! -d /tmp/brew_cache ]; then
    mkdir /tmp/brew_cache
fi
if [ ! -d /tmp/brew_tmp ]; then
    mkdir /tmp/brew_tmp
fi
export HOMEBREW_CACHE=/tmp/brew_cache
export HOMEBREW_TMP=/tmp/brew_tmp
