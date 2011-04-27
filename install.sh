#/bin/sh

CURRENT=`pwd`
git submodule foreach git pull origin master

if [ -d ~/.vim ] ; then
    rm ~/.vim
    rm ~/.vimrc
fi

ln -s $CURRENT/.vim ~/.vim
ln -s $CURRENT/.vimrc ~/.vimrc

ln -s $CURRENT/syntastic/doc ~/.vim/doc
ln -s $CURRENT/syntastic/plugin ~/.vim/plugin
ln -s $CURRENT/syntastic/syntax_checkers ~/.vim/syntax_checkers

echo "Installed !"
