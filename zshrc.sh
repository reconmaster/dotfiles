# Symlink to this file from ~/.zshrc
# You should also symlink ~/.zshenv to zsh/env in this directory

# Also symlink ~/.zprofile to zsh/profile

# @bug this currently doesn't work for some reason. Sourcing the
# .profile code from here.

# @TODO write an quick script that intializes the correct symlinks
# upon a new deployment of these dotfiles. See github for examples of
# how people do this

. ~/dotfiles/zsh/config.sh
. ~/dotfiles/zsh/aliases.sh
#. ~/dotfiles/zsh/profile.sh

# Warning (emacs): You appear to be setting environment variables
# ("PATH") in your .bashrc or .zshrc: those files are only read by
# interactive shells, so you should instead set environment variables in
# startup files like .bash_profile or .zshenv.  Refer to your shell's
# man page for more info.  In future, exec-path-from-shell will not read
# variables set in the wrong files.

# Get the stuff from bash unless you need to change something that is
# zsh specific. Arch uses profile that resets the $PATH variable if
# set in .zshenv
# . ~/dotfiles/bash/env.sh

##################################
# dotfiles-local
###################################
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
