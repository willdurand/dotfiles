#!/bin/bash

CURRENT=`pwd`

if [ -f ~/.gitconfig ]
then
  mv ~/.gitconfig ~/gitconfig.backup
  echo "Existing .gitconfig >>> gitconfig.backup"
fi

ln -s $CURRENT/gitconfig ~/.gitconfig

if [ -f ~/.gitattributes ]
then
  mv ~/.gitattributes ~/gitattributes.backup
  echo "Existing .gitattributes >>> gitattributes.backup"
fi

ln -s $CURRENT/gitattributes ~/.gitattributes

git submodule init && git submodule update

cd $CURRENT/vim-config
./install.sh

cd $CURRENT/zsh-config
./install.sh

echo "All done."
