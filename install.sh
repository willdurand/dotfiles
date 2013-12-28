#!/usr/bin/env bash

CURRENT=`pwd`

set -u
set -e

# Scripts
if [ -L ~/.scripts ] ; then
    rm ~/.scripts
fi

ln -s "$CURRENT/scripts" ~/.scripts

if [ ! -d ~/.zsh ] ; then
    mkdir ~/.zsh
fi

if [ -L ~/.zsh/prompt_pure_setup ] ; then
    rm ~/.zsh/prompt_pure_setup
fi

ln -s "$CURRENT/pure/pure.zsh" ~/.zsh/prompt_pure_setup

if [ -L ~/.zsh/_git ]; then
    rm ~/.zsh/_git
fi

ln -s "$CURRENT/_git" ~/.zsh/_git

# ZSH
if [ -L ~/.zshrc ] ; then
    rm ~/.zshrc
fi

ln -s "$CURRENT/zshrc" ~/.zshrc

echo "zsh-config successfully installed"
