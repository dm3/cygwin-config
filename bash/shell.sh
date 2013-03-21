#!/bin/bash

# vi mode
set -o vi
# ignore typos
shopt -s cdspell
# do not blindly execute !! commands
shopt -s histverify

export HISTFILESIZE=10000
export HISTSIZE=10000
# Don't put duplicate lines/spaces in the history.
export HISTCONTROL=ignoreboth
# Ignore some controlling instructions
export HISTIGNORE="&:exit:bg:fg:ls"

export CDPATH=.:~

# prompt
PS1='\[\033]0;\W [\u@\h] \!\007\]\h \[\033[1;36m\](\A) \! \[\033[1;33m\]\w \[\033[0;37m\] $(__git_ps1 "(%s)")\n\# > '
