# TODO Should probably keep these two the same unless zsh specific env
# stuff starts to appear in the code

# NB Only the stuff in here gets sourced to emacs

# This is what emacs sources
. ~/dotfiles/bash/env.sh

# More powerful globbing
setopt extended_glob

# gnome- keyring
if [ -n "$XDG_SESSION_ID" ] || [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
