#!/bin/bash

sudo apt update
sudo apt upgrade -y

echo "Installing git"
sudo apt install git -y
ln .gitconfig ~/.gitconfig
sudo ln git-tree.sh /usr/local/bin/git-tree
sudo ln git_update_repos.sh /usr/local/bin/gitrup

echo "Installing lscolors"
mkdir -p ~/.local/share
ln lscolors.sh ~/.local/share/lscolors.sh
ln lscolors.fish ~/.local/share/lscolors.fish

echo "Installing mutt"
echo "Instaling isync"
sudo apt install mutt isync -y
mkdir ~/.mutt
ln muttrc ~/.mutt/muttrc
ln signature ~/.mutt/signature
ln mbsyncrc ~/.mbsyncrc

echo "Installing tmux"
sudo apt install tmux -y
ln tmux.conf ~/.tmux.conf

echo "Installing vim"
sudo apt install vim -y
sh -c "./plug_install.sh"
ln .vimrc ~/.vimrc
vim -c "PlugInstall"

echo "Installing zsh"
sudo apt install zsh -y
sh -c "./zsh_install.sh"
ln .zshrc ~/.zshrc

echo "Installing curl"
sudo apt install curl -y

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo "export NVM_DIR=\"$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s \""${HOME}"/.nvm\" || printf %s \""${XDG_CONFIG_HOME}"/nvm\")\"" >> ~/.zshrc
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.zshrc

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing kitty"
sudo apt install kitty -y
mkdir -p ~/.config/kitty
ln kitty.conf ~/.config/kitty/
