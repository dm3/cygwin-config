if [ -x "$(which rbenv)" ]; then
    eval "$(rbenv init -)"
fi

if [ -f '/etc/bash_completion.d/mpc' ]; then
    source '/etc/bash_completion.d/mpc'
fi

export MY_SCRIPTS="$HOME/my_scripts"
source "$MY_SCRIPTS/git/git-completion.sh"
source "$MY_SCRIPTS/bash/aliases.sh"
source "$MY_SCRIPTS/bash/functions.sh"
source "$MY_SCRIPTS/bash/shell.sh"
source "$HOME/.memoryrc"

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
#alias ssh="TERM=linux ssh"
