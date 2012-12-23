#!/usr/bin/env bash

CURRENT=`pwd`

# Scripts
if [ -L ~/.scripts ] ; then
    rm ~/.scripts
fi

ln -s $CURRENT/scripts ~/.scripts

if [ ! -d ~/.zsh ] ; then
    mkdir ~/.zsh
fi

if [ -L ~/.zsh/func ] ; then
    rm ~/.zsh/func
fi

ln -s $CURRENT/func ~/.zsh/func

# ZSH
if [ -L ~/.zshrc ] ; then
    rm ~/.zshrc
fi

ln -s $CURRENT/zshrc ~/.zshrc

echo "zsh-config successfully installed"
