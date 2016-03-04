#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# zsh
ln -s ${BASEDIR}/bashrc ~/.bashrc

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/oh-my-zsh ~/.oh-my-zsh

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
ln -s ${BASEDIR}/.gitmodules ~/.gitmodules

# emacs
ln -s ${BASEDIR}/emacs ~/.emacs
