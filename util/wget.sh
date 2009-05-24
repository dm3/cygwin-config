#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: wget.sh (single || multi) URL"
else
    case "$1" in
        single) wget $2 ;;
        multi) wget -l 2 -kr $2 ;;
        *) echo "First argument must be either single or multi"
    esac
fi
