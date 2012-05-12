#!/usr/bin/env bash

CURRENT=`pwd`

# Git config
if [ -f ~/.gitconfig ] ; then
    mv ~/.gitconfig ~/gitconfig.backup
    echo "Existing .gitconfig       >>> gitconfig.backup"
fi

if [ -f ~/.gitattributes ] ; then
    mv ~/.gitattributes ~/gitattributes.backup
    echo "Existing .gitattributes   >>> gitattributes.backup"
fi

ln -s $CURRENT/gitconfig ~/.gitconfig
ln -s $CURRENT/gitattributes ~/.gitattributes

# Mercurial config
if [ -f ~/.hgrc ] ; then
    mv ~/.hgrc ~/hgrc.backup
    echo "Existing .hgrc            >>> hgrc.backup"
fi

ln -s $CURRENT/hgrc ~/.hgrc

# Elinks
if [ ! -d ~/.elinks ] ; then
    mkdir ~/.elinks
fi

if [ -f ~/.elinks/elinks.conf ] ; then
    mv ~/.elinks/elinks.conf ~/elinks.conf.backup
    echo "Existing elinks.conf      >>> elinks.conf.backup"
fi

ln -s $CURRENT/elinks/elinks.conf ~/.elinks/elinks.conf

if [ '1' -eq "$#" ] && [ '--config-only' == "$1" ] ; then
    echo "Skipped submodules installation"
else
    # Submodules
    git submodule update --init

    cd $CURRENT/vim-config
    ./install.sh

    cd $CURRENT/zsh-config
    ./install.sh
fi

echo "All done"
