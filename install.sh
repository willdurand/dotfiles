#/bin/sh

CURRENT=`pwd`

git submodule update --init

# Remove old installations
if [ -d ~/.vim ] ; then
    rm -rf ~/.vim
    rm -rf ~/.vimrc
fi

# Vim
ln -s $CURRENT/vim ~/.vim
ln -s $CURRENT/vimrc ~/.vimrc

# Here we go :)
echo "Installed !"
