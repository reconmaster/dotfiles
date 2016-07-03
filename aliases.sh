# These are aliases that need to be used in both bash and zsh

###################################
# Editor
###################################

#alias e='emacsclient "$@" -a ""'
#run new client or start a new daemon if not one running
alias et='emacsclient "$@" -t -a ""'

#if you want a frame
alias ef='emacsclient "$@" -c -a ""'

# Found out you can use tramp to edit in sudo /sudo::~/whatever
#alias se='sudo emacsclient -t'

# edit with vim (sudo tasks)
alias ev='vim'

###################################
# Python
###################################
alias pipup='pip freeze --local | grep -v "^\-e" | cut -d = -f 1  | xargs pip install -U'

# jupyter notebook
alias notebook='jupyter notebook'

###################################
# Research
###################################
alias ipy='ipython --pylab'

###################################
# ZSH
###################################

# move multiple files
alias mmv='noglob zmv -W'

###################################
# dotfiles-local
###################################
if [ -f ~/.aliases_local ]; then
    source ~/.aliases_local
fi
