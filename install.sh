#/bin/sh

CURRENT=`pwd`

echo "Get submodules"
git submodule update --init

if test -L ~/.oh-my-zsh
then
    echo "Removed old oh-my-zsh"
    rm ~/.oh-my-zsh
fi

echo "Symlink oh-my-zsh"
ln -s $CURRENT/.oh-my-zsh ~/.oh-my-zsh

if test -L ~/.scripts
then
    echo "Removed old scripts"
    rm ~/.scripts
fi

echo "Symlink scripts"
ln -s $CURRENT/scripts ~/.scripts

if test -L ~/.zshrc
then
    echo "Removed old .zshrc"
    rm ~/.zshrc
fi

echo "Symlink ZSH config"
ln -s $CURRENT/zshrc ~/.zshrc

echo "Installed !"
