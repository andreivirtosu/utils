#!/bin/bash

sudo apt install git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://raw.githubusercontent.com/yandreiy/utils/master/.vimrc -O ~/.vimrc
vim -c "VundleInstall"
