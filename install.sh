#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc

# zsh
ln -s ${BASEDIR}/bashrc ~/.bashrc

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
ln -s ${BASEDIR}/.gitmodules ~/.gitmodules
ln -s ${BASEDIR}/.gitignore ~/.gitignore

# emacs
ln -s ${BASEDIR}/emacs ~/.emacs
