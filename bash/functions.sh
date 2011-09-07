#!/bin/bash

# .. http://www.shell-fu.org/lister.php?id=769
# Usage .. [n]
# Go up n-levels.
# i.e.: .. 3 will go up 3 levels

function .. (){
  local arg=${1:-1};
  local dir=""
  while [ $arg -gt 0 ]; do
    dir="../$dir"
    arg=$(($arg - 1));
  done
  cd $dir >&/dev/null
}

# Function to pipe any command to less:
function so {
  eval "$@" |less -I~
}
