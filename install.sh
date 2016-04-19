#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# bash 
ln -s ${BASEDIR}/bashrc ~/.bashrc

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
ln -s ${BASEDIR}/hidden/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/git/gitignore ~/.gitignore
