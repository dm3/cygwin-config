#!/bin/bash

# vi mode
set -o vi
# ignore typos
shopt -s cdspell
# do not blindly execute !! commands
shopt -s histverify

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export CDPATH=.:~

# prompt
PS1='\[\033]0;\W [\u@\h] \!\007\]\h \[\033[1;36m\](\A) \! \[\033[1;33m\]\w \[\033[0;37m\] $(__git_ps1 "(%s)")\n\# > '
