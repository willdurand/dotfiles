#/bin/sh

CURRENT=`pwd`

git submodule update --init
git submodule foreach git pull origin master

if [ -d ~/.vim ] ; then
    rm -f ~/.vim
    rm -f ~/.vimrc
    rm -f ~/.vim/doc/syntastic.txt
    rm -f ~/.vim/plugin/syntastic.vim
    rm -rf ~/.vim/syntax_checkers
fi

ln -s $CURRENT/.vim ~/.vim
ln -s $CURRENT/.vimrc ~/.vimrc

cp -R $CURRENT/syntastic/doc/* ~/.vim/doc
cp -R $CURRENT/syntastic/plugin/* ~/.vim/plugin
cp -R $CURRENT/syntastic/syntax_checkers ~/.vim/syntax_checkers

echo "Installed !"
