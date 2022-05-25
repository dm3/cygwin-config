[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export MY_SCRIPTS="$HOME/my_scripts"
source "$MY_SCRIPTS/git/git-completion.sh"
source "$MY_SCRIPTS/bash/aliases.sh"
source "$MY_SCRIPTS/bash/functions.sh"
source "$MY_SCRIPTS/bash/shell.sh"

. "$HOME/.cargo/env"
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
export JAVA_HOME=$(/usr/libexec/java_home)
export COURSIER_PATH="/Users/vadim/Library/Application Support/Coursier/bin"
export PYTHON_PATH="/Users/vadim/Library/Python/3.8/bin"
export PATH="~/.local/bin:/usr/local/sbin:/usr/local/bin:$PYTHON_PATH:$COURSIER_PATH:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
