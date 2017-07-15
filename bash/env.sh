# system detection
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

###################################
# PATH
###################################

if [[ "$platform" == 'mac' ]]; then
    export PATH=~/bin:/usr/local/sbin:$PATH
else
    export PATH=~/bin:/opt/fiji:$PATH:~/.local/bin
    export LD_LIBRARY_PATH=/opt/cuda/lib64:/opt/cuda/lib:$LD_LIBRARY_PATH
fi

# bibinputs
export BIBINPUTS="~/Dropbox/bibliography/"

# IDL
#export IDL_PATH=+~/lib/idl:$IDL_PATH
export IDL_STARTUP=~/lib/idl/idlstartup.pro

# MATLAB
# export MATLABPATH=$MATLABPATH:~/lib/matlab:~/lib/matlab/linac:~/lib/matlab/export_fig:~/lib/matlab/matlab2tikz/src
export MATLABPATH=$MATLABPATH:~/devel/matlab

# Anaconda
# export PATH=~/miniconda3/bin:"$PATH"

# pdflatex
export PDFLATEX="pdflatex --shell-escape"

# plantuml
export GRAPHVIZ_DOT="/usr/bin/dot"

# ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

###################################
# virtualenv
###################################

# pyenv-virtual env
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# use the same directory for virtualenvs as virtualenvwrapper
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/devel

# if [[ "$platform" == 'mac' ]]; then
#    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
#    source /usr/local/bin/virtualenvwrapper.sh
# else
#    source ~/.local/bin/virtualenvwrapper.sh
# fi

###################################
# CUDA
###################################

# CUDA (only linux for now)
if [[ "$platform" == 'linux' ]]; then
   # core dumps
   export CUDA_ENABLE_COREDUMP_ON_EXCEPTION=1
fi

# # CUDA (only linux for now)
# if [[ "$platform" == 'linux' ]]; then
#    # core dumps
#    export CUDA_ENABLE_COREDUMP_ON_EXCEPTION=1
# fi

###################################
# emacs
###################################

# Editor config
export EDITOR=emacsclient
#export ALTERNATE_EDITOR=vim
export VISUAL=emacsclient

# Emacs Environment

###################################
# mail
###################################
export MAILDIR=~/.mail

###################################
# music
###################################
# export XDG_MUSIC_DIR=~/music
