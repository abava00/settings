#!/bin/bash
echo "hello"
cat ./linux/icon/linux.txt
echo "This script is setting file for windows"
read -p "Continue downloading?(y/N): " yn
case "$yn" in [yY]*) ;; *) echo "quited!." ; exit ;; esac
mkdir ~/.vim/
echo "mkdir ~/.vim/"
mkdir ~/.vim/bundle/
echo "mkdir ~/.vim/bundle/"
cp ./linux/.vim/vimrc ~/.vim/
echo "cp ./linux/.vim/vimrc ~/.vim/"
cp ./linux/.vim/gvimrc ~/.vim/
echo "cp ./linux/.vim/gvimrc ~/.vim/"
cp ./linux/.vim/vundlerc ~/.vim/
echo "cp ./linux/.vim/vundlerc ~/.vim/"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#bash
#vim +PluginInstall +qall
