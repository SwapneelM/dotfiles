#!/bin/bash

# Change to your home directory (~)
cd $HOME

# Clone the repository into a folder in your home directory
git clone https://github.com/SwapneelM/dotfiles.git

# Backup existing copies of your configuration files
mv .vimrc .vimrc.bak
mv .zshrc .zshrc.bak
mv .vim_runtime/ .vim_runtime_bak/

# Copy the new configuration files to your home directory
mv dotfiles/.*rc .
mv dotfiles/.vim_runtime .

# install oh-my-zsh
# requires zsh to be pre-installed on the system
# this is a dependency for all of the consequent commands
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install powerlevel9k into a subfolder for oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install zsh-autosuggestions
# add 'plugins=([other plugins...] zsh-autosuggestions)' to your .zshrc file if it isn't already present
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
# add 'plugins=([other plugins...] zsh-syntax-highlighting)' to your .zshrc file if it isn't already present
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install neofetch
# Neofetch needs to be installed based on your OS as per the instructions
# https://github.com/dylanaraps/neofetch/wiki/Installation
brew install neofetch

# install fortune
# Needs a pre-existing installation of Python
pip install fortune

# [optional] install lolcat
# Requires pre-existing installation of Ruby
gem install lolcat

# install thefuck
# Needs a pre-existing installation of Python
pip install thefuck

# Source your .zshrc file for all the changes to reflect
source ~/.zshrc
