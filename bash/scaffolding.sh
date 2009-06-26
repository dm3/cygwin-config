#!/bin/bash

export MY_DEBUG=''

my_printout() {
    echo "$@" #>&2
}
my_debug() {
    if [ -n "$MY_DEBUG" ]; then
        my_printout "DEBUG: $@"
    fi
}

while getopts ":d" opt; do
  case $opt in
    d)
      MY_DEBUG=1
      ;;
  esac
done
