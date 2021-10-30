#!/bin/bash

echo "Installing zsh packages."
if [ -f /usr/bin/apt ]; then
  sudo apt update
  sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
else
  sudo yum install -y zsh zsh-autosuggestions zsh-syntax-highlighting
fi

echo "Installing oh-my-zsh."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Change the value of ZSH_THEME to \"powerlevel10k/powerlevel10k\" to use the theme."
