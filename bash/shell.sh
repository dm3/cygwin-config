#!/bin/bash

# vi mode
set -o vi
# ignore typos
shopt -s cdspell

# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"
# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:ls:la:git st:exit:[ \t]*"

# prompt
PS1='\[\033]0;\W [\u@\h] \!\007\]\h \[\033[1;36m\](\A) \! \[\033[1;33m\]\w \[\033[0;37m\] $(__git_ps1 "(%s)")\n\# > '
