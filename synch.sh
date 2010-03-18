#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: synch IN | OUT"
else
    dir=${MY_SCRIPTS//\//\\\/} #replace all matches of / with \/

    case "$1" in
        IN)
            cp ~/.bashrc .
            cp ~/.inputrc .
            cp ~/.gitconfig .
            cp ~/.ctags .
            if [[ -n "$CYGWIN_HOME" ]]; then
                cp ~/.Xdefaults ./.Xdefaults.CYGWIN
            else
                cp ~/.xinitrc .
                cp ~/.xmobarrc ./xmobar
                cp ~/.xmonad/xmonad.hs ./xmonad/
                cat ~/.Xdefaults | sed "s/$dir/\$MY_SCRIPTS/" > ./.Xdefaults.UNIX
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
                cp .xinitrc ~
                cp xmobar/.xmobarrc ~
                cp xmonad/* ~/.xmonad/
                cat .Xdefaults.UNIX | sed "s/\$MY_SCRIPTS/$dir/" > ~/.Xdefaults
            fi
        ;;
    esac
fi
