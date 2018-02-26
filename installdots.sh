#!/bin/sh

for rcfile in dots/*; do
    ln -s `pwd`/$rcfile $HOME/.${rcfile##*/}
done

