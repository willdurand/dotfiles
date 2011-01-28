#/bin/sh

CURRENT=`pwd`

ln -s $CURRENT/.oh-my-zsh ~/.oh-my-zsh
ln -s $CURRENT/.scripts ~/.scripts
ln -s $CURRENT/.zshrc ~/.zshrc

wget --no-check-certificate https://github.com/ornicar/oh-my-zsh/raw/master/themes/ornicar.zsh-theme -O ~/.oh-my-zsh/themes/ornicar.zsh-theme

echo "Installed !"
