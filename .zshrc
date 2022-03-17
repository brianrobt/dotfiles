source ~/zsh-snap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
#znap source zsh-users/zsh-autosuggestions
znap source marlonrichert/zsh-autocomplete

# `znap eval` caches and runs any kind of command output for you.
#znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenvn 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

# User configuration
source ~/.local/share/lscolors.sh

alias ls="ls --color=always -al"
alias vim="nvim"
alias python="python3"

export DEBEMAIL="brian@amerixan.tech"
export DEBFULLNAME="Brian Thompson"
export PAGER="less"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export GOPATH="$HOME/workspace/go"
export GOROOT="/usr/local/go"
export RUBY_BIN="/home/brian/.local/share/gem/ruby/2.7.0/bin"
export NVM_DIR="$HOME/.nvm"
export GPG_TTY=$(tty)
export PATH="$PATH:/usr/local/go/bin:$RUBY_BIN:/home/brian/.local/bin"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="$PATH:~/.nvm/versions/node/v16.14.0/bin"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

