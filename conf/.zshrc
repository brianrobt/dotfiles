zstyle ':znap:*' repos-dir ~/zsh-snap/plugins
source ~/zsh-snap/znap.zsh

znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

znap prompt sindresorhus/pure

# User configuration
alias ls="ls --color=always -al"
alias vim="nvim"
alias python="python3"
alias jabba="go run /home/brt9023/workspace/go/src/github.com/shyiko/jabba/jabba.go"

export PAGER="less"
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export GOPATH="$HOME/workspace/go"
export GOROOT=
export NVM_DIR="$HOME/.nvm"
export GPG_TTY=$(tty)
export PATH="$PATH:/usr/local/go/bin"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey "^[[3~" delete-char
export SHELL=/usr/bin/zsh
export PATH="$PATH:/usr/local/android-studio/bin"
export PATH="$PATH:/home/brt9023/.cargo/bin"
