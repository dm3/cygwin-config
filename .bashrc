# * ]] &&base-files version 3.7-1

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# User dependent .bashrc file

export MY_SCRIPTS="$HOME/my_scripts"
source "$MY_SCRIPTS/git/git-completion.sh"
source "$MY_SCRIPTS/bash/aliases.sh"
source "$MY_SCRIPTS/bash/functions.sh"
source "$MY_SCRIPTS/bash/shell.sh"
# Include directives are recognized only after the merge
xrdb -merge "$HOME/.Xdefaults"

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac

# History Options
# ###############

# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:ls:la:git st:exit:[ \t]*"

# set a nice looking prompt:
PS1='\[\033]0;\W [\u@\h] \!\007\]\h \[\033[1;36m\](\A) \! \[\033[1;33m\]\w \[\033[0;37m\] $(__git_ps1 "(%s)")\n\# > '

#A function to pipe any command to less:
function so {
eval "$@" |less -I~
}
