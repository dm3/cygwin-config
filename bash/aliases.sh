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

alias c:='cd /cygdrive/c'
alias d:='cd /cygdrive/d'
alias :='cd ..'
alias ::='cd ../..'
alias :::='cd ../../..'

alias vi='vim'
alias cls='clear'

# mvn
alias mvninstall='~/my_scripts/mvn/install_file.sh'
alias mvnrun='~/my_scripts/mvn/run_class.sh'
alias mvnmodule='~/my_scripts/mvn/comment_module.sh'
alias mvnchversion='~/my_scripts/mvn/version.sh'

#svn
alias sbtowc='~/my_scripts/svn/b2wc.sh'
alias swctob='~/my_scripts/svn/wc2b.sh'
alias svnsw='~/my_scripts/svn/switch_to.sh'
alias sst='svn st'
alias si='svn info'
