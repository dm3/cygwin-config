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
            if [[ -n "$CYGWIN_HOME" ]]; then
                cp ~/.Xdefaults ./.Xdefaults.CYGWIN
                cp ~/.gitconfig ./.gitconfig.CYGWIN
            else
                cp ~/.xinitrc .
                cp ~/.xmobarrc ./xmobar
                cp ~/.xmonad/xmonad.hs ./xmonad/
                cp ~/.gitconfig ./.gitconfig.UNIX
                cat ~/.Xdefaults | sed "s/$dir/\$MY_SCRIPTS/" > ./.Xdefaults.UNIX
            fi
        ;;
        OUT)
            cp .bashrc ~
            cp .inputrc ~
	    cp .ctags ~
            if [[ -n "$CYGWIN_HOME" ]]; then
                cp .Xdefaults.CYGWIN ~/.Xdefaults
                cp .gitconfig.CYGWIN ~/.gitconfig
            else
                cp .xinitrc ~
                cp xmobar/.xmobarrc ~
                cp xmonad/* ~/.xmonad/
                cp .gitconfig.UNIX ~/.gitconfig
                cat .Xdefaults.UNIX | sed "s/\$MY_SCRIPTS/$dir/" > ~/.Xdefaults
            fi
        ;;
    esac
fi
