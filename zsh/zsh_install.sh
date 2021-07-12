#!/bin/bash

if [ -f /usr/bin/apt ]; then
  sudo apt update
  sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
  sudo apt install -y exa
else
  sudo yum install -y zsh zsh-autosuggestions zsh-syntax-highlighting
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
