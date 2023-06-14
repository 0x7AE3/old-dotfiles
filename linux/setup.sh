#!/bin/bash

# Check for dependencies
if [ -z $(which git) ]; then
	>&2 echo "Could not find Git."
	exit 1
fi
if [ -z $(which wget) ]; then
	>&2 echo "Could not find wget."
	exit 1
fi
if [ -z $(which vim) ]; then
	>&2 echo "Could not find vim."
	exit 1
fi

# Set up vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set up vimrc
wget https://raw.githubusercontent.com/AD3600/dotfiles/main/windows/vim/.vimrc?token=GHSAT0AAAAAAB4X2KWU6HXGLMQAJNYPMYZQY5JD2OQ
vim -c 'PlugInstall' -c 'qa!'

# Set up git config
git config --global user.name "first l"
git config --global user.email "email@domain.com"

# Set up bash prompt and colors
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
echo 'export TERM=xterm-256color' >> ~/.bashrc
echo 'export PS1="\[$(tput bold)\]\[\033[38;5;46m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;231m\]:\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;75m\]\w\[$(tput sgr0)\]\[\033[38;5;231m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"' >> ~/.bashrc
