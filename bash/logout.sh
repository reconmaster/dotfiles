# ~/.bash_logout: executed by bash(1) when login shell exits.

# link this to .bash_logout

# close emacs server will just check to make sure it is running on
# login
#emacsclient -e '(save-buffers-kill-emacs)'

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
