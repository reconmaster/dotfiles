# login startup stuff
print "Start each day with a problem to solve."
. ~/dotfiles/bash/env.sh

# @bug could not get this file to source with login despite linking it
# to .profile, sourcing directly from rc file for now.

# start emacs server if not running
# if [ "$(pidof emacs)" -eq 0 ]
# then
# emacs --daemon
# fi

# need to run this to avoid ein errors with self-signed certs
echo insecure > ~/.curlrc

##################################
# dotfiles-local
###################################
if [ -f ~/.profile_local ]; then
    source ~/.profile_local
fi

###################################
# startx
###################################
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
