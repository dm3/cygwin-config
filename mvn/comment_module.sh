#!/bin/bash
# TODO: modify + regexp so that it wouldn't create nested comments
if [ $# -ne 1 ]; then
    echo "Usage: comment_module +/- [FILE] (pom.xml used by default) "
else
    if [[ -f $2 ]]; then
        FILE=$2
    elif [[ -f "pom.xml" ]]; then
        FILE="pom.xml"
    else
        echo "Please specify a valid file"
        return -1
    fi
    case "$1" in
        +) sed -i 's/\(<module>.*<\/module>\)/<!--\1-->/' $FILE ;;
        -) sed -i 's/<!--\(<module>.*<\/module>\)-->/\1/' $FILE ;;
        *) echo "Second argument is either + or -"
    esac
fi
