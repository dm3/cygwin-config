#!/bin/bash

function gvimdiff() {(
    echo $@
    VIM=$VIMRUNTIME/gvim.exe
    LOCAL=$(pathToWindows $1)
    BASE=$(pathToWindows $2)
    REMOTE=$(pathToWindows $3)
    MERGED=$(pathToWindows $4)
    echo "converted: $LOCAL, $BASE, $REMOTE, $MERGED"
    $VIM --remote-tab-silent "+set buftype=nowrite" "$BASE" && sleep 1 &&
    $VIM --remote-send ":split $REMOTE<CR>:set buftype=nowrite<CR>:vertical diffsplit $MERGED<CR>:vertical diffsplit $LOCAL<CR>:set buftype=nowrite<CR>"
)}

function pathToWindows() {(
    unset REPLY
    if [[ -f $1 ]] ; then
        REPLY="$(cygpath --absolute --dos "$1" )"
    else
        touch "$1" &&
        REPLY="$(cygpath --absolute "$1" )" &&
        rm -f "$1" || echo "failed"
    fi
    echo $REPLY
)}

gvimdiff $1 $2 $3 $4
