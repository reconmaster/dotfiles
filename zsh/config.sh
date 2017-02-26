######################################################################
# Top contains features I specifically want
######################################################################

###################################
# Key Bindings
###################################

# give ZLE emacs keybindings
bindkey -e

# emacs binding and map Esc key to Meta key (not the same in zsh)
#bindkey -me

# Additional features to mimic Emacs functionality
bindkey '\C-w' kill-region

# Make working with command history easier
bindkey '^[[1~' beginning-of-history #Home
bindkey '^[[4~' end-of-history       #End

###################################
# Command Line Editing
###################################

# add-on editor command for long command lines
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

# history management
HISTFILE=~/.zsh_history

# Different sizes so that multiple terminals open all at once can
# write contents to the history file.
Savehist=10000
Histsize=30000

setopt hist_ignore_dups         # ignore duplication command history list
setopt HIST_IGNORE_SPACE        # commands preceeded by space are left out
#setopt APPEND_HISTORY           # write history only when closing
setopt inc_append_history       # incrementally append history
setopt EXTENDED_HISTORY         # add more info (like run time & exec time)
setopt hist_expire_dups_first   # remove dups first
setopt hist_find_no_dups        # only repeat previous command once
setopt hist_reduce_blanks       # remove syntactically unimportant blanks

setopt share_history            # share command history data between zsh processes

setopt hist_verify              # check line after modification

bindkey ' ' magic-space         # performs history expansion when using spacebar

###################################
# Variable Mgt
###################################

# Expand parameters of the array individually (can be done with ^ for
# single expansion or turned off with ^^)
setopt rc_expand_param

###################################
# Research Related
###################################

# trig functions
zmodload zsh/mathfunc

###################################
# Completion stuff
###################################

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# completion options
setopt COMPLETE_IN_WORD         # allow tab completion in the middle of a word

# For when I get confused
autoload -U run-help

# Change directories by typing the name on its own
setopt auto_cd

###################################
# Prompt related stuff
###################################

# to be able to include variable substitution in prompt
setopt prompt_subst

# easy colored prompts
autoload -U promptinit
promptinit

#prompt elite2

# version control info
# TODO Modify the prompt to something I like
# autoload -Uz vcs_info

# zstyle ':vcs_info:*' actionformats \
#        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats       \
#        '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
# zstyle ':vcs_info:*' enable git

# precmd () { vcs_info }
# TODO After this just need ${vcs_info_msg_0_}
# this somewhere in the prompt design
#PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f%# '

###################################
# Completion stuff
###################################

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Menu selection
zmodload zsh/complist
zstyle ':completion:*:default' menu 'select=3'

# select option but remain in menu
bindkey -M menuselect '\C-o' accept-and-menu-complete

# skip do and done in for loops using repeat with one command
setopt short_loops

###################################
# System workflow
###################################

# Load zmv module
autoload -U zmv

# auto cd
setopt autocd

# ignore duplicates in the directory stack
setopt pushd_ignore_dups

# auto put the current directory in pushd
setopt auto_pushd

# size of dirstack
Dirstacksize=100

# turn off sighup on exit
setopt nohup

######################################################################
# Stuff copied out of new .zshrc file
######################################################################


## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

######################################################################
# This is topfunky's configuration
######################################################################

# TODO Read through this to figure out what I could be tricking out

autoload -U colors
colors
#setopt prompt_subst
#PROMPT='
#%~ %{$fg_bold[black]%}$(vcprompt)
#→ %{$reset_color%}'

# Set RPROMPT to have info show up on the right, too.

###################################
# Other Options
###################################

# setopt PRINT_EXIT_VALUE

setopt CORRECT
setopt CORRECTALL

# Other tabbing options
# setopt NO_AUTO_MENU
# setopt BASH_AUTO_LIST

# Quote pasted URLs
autoload url-quote-magic
zle -N self-insert url-quote-magic

REPORTTIME=10 # Show elapsed time if command took more than X seconds
LISTMAX=0 # ask to complete if top of list would scroll off screen

# Make CTRL-W delete after other chars, not just spaces
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}

######################################################################
# oh-my-zsh
######################################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/zsh/oh-my-zsh

# Path to custom modifications to oh-my-zsh
ZSH_CUSTOM=$HOME/dotfiles/zsh/custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ad_candy"
#ZSH_THEME="ad_dieter"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
# need a check for the system/os so only the correct plugins are loaded
# when adding, modify the default linux first and then append after the system specific plugins
#
# System independent
# plugins=(autoenv battery colored-man colorize common-aliases cp dircycle dirhistory dirpersist emacs extract git git-extras gpg-agent iwhois jsontools jump pass pip python rsync screen ssh-agent sudo systemadmin tmux wd web-search zsh_reload)

case $(uname) in
  'Linux')
        if [[ -e /etc/arch-release ]]; then
           plugins=(archlinux aws systemd autoenv battery colored-man colorize common-aliases cp dircycle dirhistory dirpersist emacs extract git git-extras gpg-agent iwhois jsontools jump pass pip python pyenv rsync screen sudo systemadmin tmux wd web-search zsh_reload)
        elif [[ -e /etc/debian_version ]]; then
           plugins=(debian autoenv aws battery colored-man colorize common-aliases cp dircycle dirhistory dirpersist emacs extract git git-extras gpg-agent iwhois jsontools jump pass pip python pyenv rsync screen sudo systemadmin tmux wd web-search zsh_reload)
        else
           plugins=(autoenv aws battery colored-man colorize common-aliases cp dircycle dirhistory dirpersist emacs extract git git-extras gpg-agent iwhois jsontools jump pass pip python pyenv rsync screen sudo systemadmin tmux wd web-search zsh_reload)
        fi
  ;;
  'Darwin')
      plugins=(aws brew brew-cask osx xcode autoenv battery colored-man colorize common-aliases cp dircycle dirhistory dirpersist emacs extract git git-extras gpg-agent iwhois jsontools jump pass pip python pyenv rsync screen sudo systemadmin tmux wd web-search zsh_reload)
  ;;
esac

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

###################################
# oh-my-zsh plugin configuration
###################################

# zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:ssh-agent identities id_rsa

######################################################################
# Play nice with Emacs
######################################################################

# need this at the end since oh-my-zsh messes with the prompt

# Tramp hangs scp connection with zsh
if [[ "$TERM" == "dumb" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  # unfunction precmd
  # unfunction preexec
  PS1='$ '
fi

# Have zsh work correctly in emacs
[[ $EMACS = t ]] && unsetopt zle

######################################################################
# osx
######################################################################
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
