. ~/dotfiles/aliases.sh

######################################################################
# Topfunky's suggested aliases, more in his adanced code file
######################################################################

# TODO decide if you like his commands

# Resource Management
alias tu='top -o cpu' # cpu
alias tm='top -o vsize' # memory

######################################################################
# My Aliases
######################################################################

###################################
# System Workflow
###################################

# TODO probably plenty of stuff I can modify here to save time

# General system work

# bash has to check to see if line starts with alias to check alias
alias sudo='sudo '

# some stuff for colors I stole from ubuntu
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias pu=pushd
alias po=popd
alias dv='dirs -v'
