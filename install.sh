#!/usr/bin/env bash

CURRENT=`pwd`

# Scripts
if [ -L ~/.scripts ] ; then
    rm ~/.scripts
fi

ln -s $CURRENT/scripts ~/.scripts

# ZSH
if [ -L ~/.zshrc ] ; then
    rm ~/.zshrc
fi

ln -s $CURRENT/zshrc ~/.zshrc

echo "zsh-config successfully installed"
