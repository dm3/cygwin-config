if [ -x "$(which rbenv)" ]; then
    eval "$(rbenv init -)"
fi

if [ -f '/etc/bash_completion.d/mpc' ]; then
    source '/etc/bash_completion.d/mpc'
fi

if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

export MY_SCRIPTS="$HOME/my_scripts"
source "$MY_SCRIPTS/git/git-completion.sh"
source "$MY_SCRIPTS/bash/aliases.sh"
source "$MY_SCRIPTS/bash/functions.sh"
source "$MY_SCRIPTS/bash/shell.sh"
source "$HOME/.memoryrc"

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=~/.local/bin:/usr/local/sbin:/usr/local/bin:$PATH
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
#alias ssh="TERM=linux ssh"
