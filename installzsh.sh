#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    ln -s `pwd`/oh-my-zsh $HOME/.oh-my-zsh
fi

if [ ! -d "$HOME/.zshrc" ]; then
    ln -s `pwd`/dotfiles/.zshrc $HOME/.zshrc
fi
