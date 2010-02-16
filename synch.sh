#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    case "$1" in
        IN)
            cp ~/.bashrc .
            cp ~/.inputrc .
            cp ~/.gitconfig .
            cp ~/.ctags .
            if [[ -n "$CYGWIN_HOME" ]]; then
                cp ~/.Xdefaults ./.Xdefaults.CYGWIN
            else
                cp ~/.Xdefaults ./.Xdefaults.UNIX
            fi
        ;;
        OUT)
            cp .bashrc ~
            cp .inputrc ~
            cp .gitconfig ~
	    cp .ctags ~
            if [[ -n "$CYGWIN_HOME" ]]; then
                cp .Xdefaults.CYGWIN ~/.Xdefaults
            else
                cp .Xdefaults.UNIX ~/.Xdefaults
            fi
        ;;
    esac
fi
