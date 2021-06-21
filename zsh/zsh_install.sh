#!/bin/bash

sudo apt update
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
sudo apt install -y exa

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
