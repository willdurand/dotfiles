#/bin/sh

CURRENT=`pwd`

git submodule init && git submodule update

ln -s $CURRENT/.oh-my-zsh ~/.oh-my-zsh
ln -s $CURRENT/.scripts ~/.scripts
ln -s $CURRENT/.zshrc ~/.zshrc

echo "Installed !"
