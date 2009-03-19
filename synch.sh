#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    case "$1" in
        IN)
            cp ~/.bashrc .
            cp ~/.gitconfig .
	    cp ~/.ctags .
	    cp ~/.Xdefaults .
        ;;
        OUT)
            cp .bashrc ~
            cp .gitconfig ~
	    cp .ctags ~
	    cp .Xdefaults ~
        ;;
    esac
fi
