#!/bin/bash
echo "Installing nvm"
echo "Installing curl"
dnf install curl -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
#echo "export NVM_DIR=\"$([ -z ${XDG_CONFIG_HOME-} ] && printf %s \"${HOME}/.nvm\" || printf %s \"${XDG_CONFIG_HOME}/nvm\")\"" >> ~/.zshrc
#echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.zshrc

