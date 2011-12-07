#/bin/sh

CURRENT=`pwd`

ln -s $CURRENT/scripts ~/.scripts
ln -s $CURRENT/zshrc ~/.zshrc

echo "Installed !"
