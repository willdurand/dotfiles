#!/usr/bin/env bash

CURRENT=`pwd`
INSTALL_ZSH=true
INSTALL_VIM=true
CONFIG_ONLY=false

# Parsing options
if [ $# -gt 0 ] ; then
    for arg in $@ ; do
        if [ $arg = '--no-zsh' ] ; then
            INSTALL_ZSH=false
        elif [ $arg = '--no-vim' ] ; then
            INSTALL_VIM=false
        elif [ $arg = '--config-only' ] ; then
	    CONFIG_ONLY=true
	fi
    done
fi

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

if [ -f ~/.gitignore_global ] ; then
    cat ~/.gitignore_global > ~/gitignore_global.backup
    rm -f ~/.gitignore_global
    echo "Existing .gitignore_global   >>> gitignore_global.backup"
fi

if [ -f ~/.git-completion.sh ] ; then
    rm -f ~/.git-completion.sh
fi

ln -s $CURRENT/gitconfig ~/.gitconfig
ln -s $CURRENT/gitattributes ~/.gitattributes
ln -s $CURRENT/gitignore_global ~/.gitignore_global
ln -s $CURRENT/git-completion.bash ~/.git-completion.sh

git config --global core.excludesfile ~/.gitignore_global

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

# Ack
if [ -f ~/.ackrc ] ; then
    rm -f ~/.ackrc
fi

ln -s $CURRENT/ackrc ~/.ackrc

# Vim/Zsh

if $CONFIG_ONLY ; then
    echo "Skipped submodules installation"
else
    # Submodules
    git submodule update --init

    if $INSTALL_VIM ; then
        cd $CURRENT/vim-config
        ./install.sh
    fi

    if $INSTALL_ZSH ; then
        cd $CURRENT/zsh-config
        ./install.sh
    fi
fi
