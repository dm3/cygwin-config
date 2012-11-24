# Aliases
# #######
#  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias vi='vim'
alias cls='clear'

alias size='du -sh'
alias lines='$MY_SCRIPTS/util/count_lines.sh'
findhere() { find . -path '**/target' -prune -o -path '**/.svn' -prune -o -name "$1" | xargs grep --color -E "$2" ;}

# workaround for ghcii not being on the path
alias ghcii=`whence ghci | sed 's/ghci is \(.*bin\)\/.*$/\1\/ghcii.sh/'`

# mvn
alias mvninstall='$MY_SCRIPTS/mvn/install_file.sh'
alias mvnrun='$MY_SCRIPTS/mvn/run_class.sh'
alias mvnchversion='$MY_SCRIPTS/mvn/version.sh'
alias mcp='mvn clean package'
alias mci='mvn clean install'
alias mct='mvn clean test'
alias mew='mvn prepare-package war:exploded'

#svn
alias svnsw='$MY_SCRIPTS/svn/switch_to.sh'
alias svnserver='$MY_SCRIPTS/svn/svnversion.py'
alias sbtowc='$MY_SCRIPTS/svn/b2wc.sh'
alias swctob='$MY_SCRIPTS/svn/wc2b.sh'
alias sbranchstart="svn log -q --stop-on-copy | grep '^r[0-9]' | sed 's/^r//;s/ |.*//' | tail -n 1"
alias sst='svn st'
alias si='svn info'
alias sdiff="svn diff --diff-cmd kdiff3 -x ' -qall '"

#hg
alias hrvn='hg revert --no-backup'
