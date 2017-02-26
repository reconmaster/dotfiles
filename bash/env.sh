# system detection
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='mac'
fi

# Path related
if [[ "$platform" == 'mac' ]]; then
    export PATH=~/bin:/usr/local/sbin:$PATH
else
    export PATH=~/bin:/opt/fiji:$PATH:~/.local/bin
    export LD_LIBRARY_PATH=/opt/cuda/lib64:/opt/cuda/lib:$LD_LIBRARY_PATH
fi

# IDL
#export IDL_PATH=+~/lib/idl:$IDL_PATH
export IDL_STARTUP=~/lib/idl/idlstartup.pro

# MATLAB
# export MATLABPATH=$MATLABPATH:~/lib/matlab:~/lib/matlab/linac:~/lib/matlab/export_fig:~/lib/matlab/matlab2tikz/src
export MATLABPATH=$MATLABPATH:~/devel/matlab

# Anaconda
export PATH=~/miniconda3/bin:"$PATH"

###################################
# virtualenv
###################################

# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/devel

if [[ "$platform" == 'mac' ]]; then
   export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
   source /usr/local/bin/virtualenvwrapper.sh
else
   source ~/.local/bin/virtualenvwrapper.sh
fi

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

# Editor config
export EDITOR=emacsclient
#export ALTERNATE_EDITOR=vim
export VISUAL=emacsclient

# Emacs Environment

# bibinputs
export BIBINPUTS="~/Dropbox/bibliography/"

# pdflatex
export PDFLATEX="pdflatex --shell-escape"

# plantuml
export GRAPHVIZ_DOT="/usr/bin/dot"

# ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

###################################
# mail
###################################
export MAILDIR=~/.mail
