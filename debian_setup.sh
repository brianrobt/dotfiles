#!/bin/bash

sudo apt install git
ln git/gitconfig ~/.gitconfig
sudo ln git/git-tree.sh /usr/local/bin/git-tree
sudo ln git/git_update_repos.sh /usr/local/bin/gitrup

mkdir -p ~/.local/share
ln lscolors/lscolors.sh ~/.local/share/lscolors.sh
ln lscolors/lscolors.fish ~/.local/share/lscolors.fish

sudo apt install mutt isync
mkdir ~/.mutt
ln mutt/muttrc ~/.mutt/muttrc
ln mutt/signature ~/.mutt/signature
ln mutt/mbsyncrc ~/.mbsyncrc

sudo apt install tmux
ln tmux/tmux.conf ~/.tmux.conf

sudo apt install vim
sh -c "vim/plug_install.sh"
ln vim/vimrc ~/.vimrc
vim -c "PlugInstall"

sudo apt install zsh fish
sh -c "zsh/zsh_install.sh"
ln zsh/zshrc ~/.zshrc

sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
sudo ln debian/apt/sources.list /etc/apt/sources.list
ln debian/config/kitty.conf ~/.config/kitty/kitty.conf
sudo ln debian/usr/local/bin/findr.sh /usr/local/bin/findr
