#!/usr/bin/env bash

CURRENT=`pwd`

if [ -L ~/.vimrc ] ; then
    rm -rf ~/.vimrc
fi

if [ -L ~/.vim ] ; then
    rm -rf ~/.vim
fi

git submodule update --init

ln -s $CURRENT/vim ~/.vim
ln -s $CURRENT/vimrc ~/.vimrc

echo "vim-config successfully installed"
