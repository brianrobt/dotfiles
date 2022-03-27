# User configuration
alias ls="ls --color=always -al"
alias vim="nvim"
alias python="python3"

export PAGER="less"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export GOPATH="$HOME/workspace/go"
export GOROOT="/usr/local/go"
export NVM_DIR="$HOME/.nvm"
export GPG_TTY=$(tty)
export PATH="$PATH:/usr/local/go/bin"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey "^[[3~" delete-char
