#!/bin/bash

source "$MY_SCRIPTS/bash/scaffolding.sh"

REGEX='.*\(\.java\|\.xml\|\.groovy\|\.js\)$'

# --------------- BEGIN PARAMETERS
while getopts ":r:" opt; do
  case $opt in
    r)
      REGEX=$OPTARG
      ;;
    \?)
      my_printout "Usage: [-d] [-r REGEX]"
      exit 1
      ;;
    :)
      requires_arg
      ;;
  esac
done
# --------------- END PARAMETERS

lines=0
while read x; do
    let lines=$lines+$x
done < <(find . -type f -regex "$REGEX" -exec wc -l '{}' \; | awk '{print $1}')

my_debug "pattern: $REGEX"
my_debug "Total lines: $lines"
my_printout $lines
