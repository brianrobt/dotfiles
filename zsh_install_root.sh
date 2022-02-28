#!/bin/bash
echo "Installing oh-my-zsh."
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Install powerlevel10k"
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k
echo "Change the value of ZSH_THEME to \"powerlevel10k/powerlevel10k\" to use the theme."
