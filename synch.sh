#!/usr/bin/env bash
set -eu -o pipefail

if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    dir=${MY_SCRIPTS//\//\\\/} #replace all matches of / with \/

    case "$1" in
        IN)
            cp ~/.vimrc .
            cp ~/.gitconfig .
            cp ~/.bash_profile .
            cp ~/.inputrc .
            cp ~/.gitconfig ./.gitconfig
            cat ~/.Xresources | sed "s/$dir/\$MY_SCRIPTS/" > ./.Xresources
        ;;
        OUT)
            cp .vimrc ~
            cp .gitconfig ~
            cp .bash_profile ~
            cp .inputrc ~
            cp .gitconfig ~/.gitconfig
            cat .Xresources | sed "s/\$MY_SCRIPTS/$dir/" > ~/.Xresources
        ;;
    esac
fi
