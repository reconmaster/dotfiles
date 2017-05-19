# Symlink to this file from ~/.bashrc

# . ~/dotfiles/bash/config.conf
# . ~/dotfiles/bash/aliases.conf
#. ~/dotfiles/bash/profile.conf

###################################
# dotfiles-local
###################################
if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
