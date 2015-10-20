#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    dir=${MY_SCRIPTS//\//\\\/} #replace all matches of / with \/

    case "$1" in
        IN)
            cp ~/.vimrc .
            cp ~/.bashrc .
            cp ~/.inputrc .
            cp ~/.ctags .
            cp ~/.mpdconf .
            cp ~/.xmonad/xmonad.hs ./xmonad/
            cp ~/.gitconfig ./.gitconfig
            cp ~/.spacemacs ./.spacemacs
            cp ~/.codex ./.codex
            cp -r ~/.irssi/* ./irssi/
            cat ~/.Xresources | sed "s/$dir/\$MY_SCRIPTS/" > ./.Xresources
        ;;
        OUT)
            cp .vimrc ~
            cp .bashrc ~
            cp .inputrc ~
	    cp .ctags ~
            cp .mpdconf ~
            cp .spacemacs ~
            cp .codex ~
            cp xmonad/* ~/.xmonad/
            cp .gitconfig ~/.gitconfig
            cp -r ./irssi/* ~/.irssi/
            cat .Xresources | sed "s/\$MY_SCRIPTS/$dir/" > ~/.Xresources
        ;;
    esac
fi
