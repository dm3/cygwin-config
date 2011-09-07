#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    dir=${MY_SCRIPTS//\//\\\/} #replace all matches of / with \/

    case "$1" in
        IN)
            cp ~/.bashrc .
            cp ~/.inputrc .
            cp ~/.ctags .
            cp ~/.Xdefaults ./.Xdefaults
            cp ~/.gitconfig ./.gitconfig
        ;;
        OUT)
            cp .bashrc ~
            cp .inputrc ~
	    cp .ctags ~
            cp .Xdefaults ~/.Xdefaults
            cp .gitconfig ~/.gitconfig
        ;;
    esac
fi
