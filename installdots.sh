#!/bin/sh

function remove()
{
    if [ -L $HOME/.${rcfile##*/} ]; then
        unlink $HOME/.${rcfile##*/}
    elif [ -e $HOME/.${rcfile##*/} ]; then
        rm -f $HOME/.${rcfile##*/}
    fi
}

for rcfile in dots/*; do
    remove $HOME/.${rcfile##*/}
    ln -s `pwd`/$rcfile $HOME/.${rcfile##*/}
done

