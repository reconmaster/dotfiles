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


linux_bash="$HOME/.ssh/service/ssh-agent"
if [ -e "$linux_bash" ];then
setsid "$linux_bash" 2>&1 & disown
fi
