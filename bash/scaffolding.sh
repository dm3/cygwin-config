#!/bin/bash

export MY_DEBUG=''

now() {
    date '+%Y-%m-%d %H:%M:%S'
}
my_printout() {
    echo "$@" #>&2
}
my_debug() {
    if [ -n "$MY_DEBUG" ]; then
        my_printout "DEBUG: $@"
    fi
}
requires_arg() {
    my_printout "Option -$OPTARG requires an argument."
    exit 1
}

while getopts ":d" opt; do
  case $opt in
    d)
      MY_DEBUG=1
      ;;
  esac
done

#reset OPTIND so that scripts sourcing this scaffolding could parse options too
if [ -n "$MY_DEBUG" ]; then
    OPTIND=2 #-d (debug) argument must always come first
else
    OPTIND=1
fi
