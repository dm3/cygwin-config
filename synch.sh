#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    case "$1" in
        IN)
            cp ../.bashrc .
            cp ../.gitconfig .
	    cp ../.ctags .
        ;;
        OUT)
            cp .bashrc ../
            cp .gitconfig ../
	    cp .ctags ../
        ;;
    esac
fi
