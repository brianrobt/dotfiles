# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"
#source ~/.oh-my-zsh/custom/themes/zsh-theme/moarram.zsh-theme

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
  colorize
  gh
  git
  gitignore
  gnu-utils
  gpg-agent
  man
  node
  npm
  nvm
  pip
  python
  pylint
  sudo
  systemd
  vim-interaction
)

# User configuration

source $ZSH/oh-my-zsh.sh
alias ls="ls --color=always -al"
alias vim="nvim"

export DEBEMAIL="brian@amerixan.tech"
export DEBFULLNAME="Brian Thompson"
export PAGER="less"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GOPATH="$HOME/workspace/go"
export GOROOT="/usr/local/go"
export RUBY_BIN="/home/brian/.local/share/gem/ruby/2.7.0/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#[ -s "/home/brian/.jabba/jabba.sh" ] && source "/home/brian/.jabba/jabba.sh"

# mc related
#if [ -f /usr/lib/mc/mc.sh ]; then
#	. /usr/lib/mc/mc.sh
#fi
#export PRETTIER_PATH=$(which prettier)
export GPG_TTY=$(tty)

#source ~/.local/share/lscolors.sh
#source "$HOME/.oh-my-zsh/custom/plugins/gh/github_completions.zsh"
#source "$HOME/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

alias python="python3"

export PATH=$PATH:/usr/local/go/bin:$RUBY_BIN:/home/brian/.local/bin
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

export PATH="$PATH:~/.nvm/versions/node/v16.14.0/bin"
