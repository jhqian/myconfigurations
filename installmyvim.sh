#!/bin/bash

if [ ! -d "$HOME/.vim" ]; then
    ln -s `pwd`/vim/.vim $HOME/.vim
fi

#if [ ! -d "$HOME/.vimrc" ]; then
#    ln -s `pwd`/vim/.vimrc $HOME/.vimrc
#fi
