#!/usr/bin/env bash

CURRENT=`pwd`

# Git config
if [ -f ~/.gitconfig ] ; then
    cat ~/.gitconfig > ~/gitconfig.backup
    rm -f ~/.gitconfig
    echo "Existing .gitconfig       >>> gitconfig.backup"
fi

if [ -f ~/.gitattributes ] ; then
    cat ~/.gitattributes > ~/gitattributes.backup
    rm -f ~/.gitattributes
    echo "Existing .gitattributes   >>> gitattributes.backup"
fi

ln -s $CURRENT/gitconfig ~/.gitconfig
ln -s $CURRENT/gitattributes ~/.gitattributes

# Mercurial config
if [ -f ~/.hgrc ] ; then
    cat ~/.hgrc > ~/hgrc.backup
    rm -f ~/.hgrc
    echo "Existing .hgrc            >>> hgrc.backup"
fi

ln -s $CURRENT/hgrc ~/.hgrc

# Elinks
if [ ! -d ~/.elinks ] ; then
    mkdir ~/.elinks
fi

if [ -f ~/.elinks/elinks.conf ] ; then
    cat ~/.elinks/elinks.conf > ~/elinks.conf.backup
    rm -f ~/.elinks/elinks.conf
    echo "Existing elinks.conf      >>> elinks.conf.backup"
fi

ln -s $CURRENT/elinks/elinks.conf ~/.elinks/elinks.conf

# Tmux
if [ -f ~/.tmux.conf ] ; then
    cat ~/.tmux.conf > ~/tmux.conf.backup
    rm -f ~/.tmux.conf
    echo "Existing tmux.conf        >>> tmux.conf.backup"
fi

ln -s $CURRENT/tmux.conf ~/.tmux.conf

# Vim/Zsh
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
