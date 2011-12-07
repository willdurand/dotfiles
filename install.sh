#/bin/sh

CURRENT=`pwd`

# Remove old installations
if [ -d ~/.vim ] ; then
    rm -rf ~/.vim
    rm -rf ~/.vimrc
fi

# Vim
ln -s $CURRENT/vim ~/.vim
ln -s $CURRENT/vimrc ~/.vimrc

# Syntasti# Command-T
cd ~/.vim/ruby/command-t
ruby extconf.rb
make clean && make
cd $CURRENT

# Here we go :)
echo "Installed !"
