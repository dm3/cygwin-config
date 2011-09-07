# * ]] &&base-files version 3.7-1

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# User dependent .bashrc file

export MY_SCRIPTS="$HOME/my_scripts"
source "$HOME/.memoryrc"
source "$MY_SCRIPTS/git/git-completion.sh"
source "$MY_SCRIPTS/bash/aliases.sh"
source "$MY_SCRIPTS/bash/functions.sh"
source "$MY_SCRIPTS/bash/shell.sh"
