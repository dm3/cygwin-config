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
            cp ~/.xinitrc .
            cp ~/.xmobarrc ./xmobar
            cp ~/.xmonad/xmonad.hs ./xmonad/
            cp ~/.gitconfig ./.gitconfig
            cat ~/.Xdefaults | sed "s/$dir/\$MY_SCRIPTS/" > ./.Xdefaults
        ;;
        OUT)
            cp .bashrc ~
            cp .inputrc ~
	    cp .ctags ~
            cp .xinitrc ~
            cp xmobar/.xmobarrc ~
            cp xmonad/* ~/.xmonad/
            cp .gitconfig ~/.gitconfig
            cat .Xdefaults | sed "s/\$MY_SCRIPTS/$dir/" > ~/.Xdefaults
        ;;
    esac
fi
