#!/bin/sh

function remove() {
    if [ -L $1 ]; then
        echo unlink $1
        unlink $1
    elif [ -e $1 ]; then
        echo rm -rf $1
        rm -rf $1
    fi
}

remove $HOME/.vim
remove $HOME/.vimrc

echo ln -s `pwd`/vimfiles $HOME/.vim
ln -s `pwd`/vimfiles $HOME/.vim
echo ln -s `pwd`/vimfiles/vimrc $HOME/.vimrc
ln -s `pwd`/vimfiles/vimrc $HOME/.vimrc
