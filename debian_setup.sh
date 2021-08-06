#!/bin/bash

confirm="y"

function confirm_package() {
  if [[ ! $confirm==[yY] ]]; then
    exit 1
  fi
}

read -p "Would you like to install git? (y/n) " | confirm_package
sudo apt install git -y
ln git/gitconfig ~/.gitconfig
sudo ln git/git-tree.sh /usr/local/bin/git-tree
sudo ln git/git_update_repos.sh /usr/local/bin/gitrup

read -p "Would you like to install custom LS_COLORS? (y/n) " | confirm_package
mkdir -p ~/.local/share
ln lscolors/lscolors.sh ~/.local/share/lscolors.sh
ln lscolors/lscolors.fish ~/.local/share/lscolors.fish

read -p "Would you like to install mutt? (y/n) " | confirm_package
sudo apt install mutt isync -y
mkdir ~/.mutt
ln mutt/muttrc ~/.mutt/muttrc
ln mutt/signature ~/.mutt/signature
ln mutt/mbsyncrc ~/.mbsyncrc

read -p "Would you like to install tmux? (y/n) " | confirm_package
sudo apt install tmux -y
ln tmux/tmux.conf ~/.tmux.conf

read -p "Would you like to install vim? (y/n) " | confirm_package
sudo apt install vim -y
sh -c "vim/plug_install.sh"
ln vim/vimrc ~/.vimrc
vim -c "PlugInstall"

read -p "Would you like to install other shells (zsh,fish)? (y/n) " | confirm_package
sudo apt install zsh fish -y
sh -c "zsh/zsh_install.sh"
ln zsh/zshrc ~/.zshrc

#read -p "Would you like to add custom sources for apt? (y/n) " | confirm_package
#sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
#sudo ln debian/apt/sources.list /etc/apt/sources.list
#ln debian/config/kitty.conf ~/.config/kitty/kitty.conf
#sudo ln debian/usr/local/bin/findr.sh /usr/local/bin/findr

read -p "Would you like to install nvm? (y/n) " | confirm_package
sudo apt install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo "export NVM_DIR=\"$([ -z ${XDG_CONFIG_HOME-} ] && printf %s \"${HOME}/.nvm\" || printf %s \"${XDG_CONFIG_HOME}/nvm\")\"" >> ~/.zshrc
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.zshrc

read -p "Would you like to install ohmyzsh? (y/n) " | confirm_package
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

read -p "Would you like to install fisher? (y/n) " | confirm_package
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
