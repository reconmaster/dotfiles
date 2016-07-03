# Activates autoenv or reports its failure
if [[ "$platform" == 'mac' ]]; then
    if ! source /usr/local/bin/activate.sh 2>/dev/null; then
        echo '-------- AUTOENV ---------'
        echo 'Could not find ~/.local/bin/activate.sh.'
        echo 'Please check if autoenv is correctly installed.'
        echo 'In the meantime the autoenv plugin is DISABLED.'
        echo '--------------------------'
        return 1
    fi
else
    if ! source $HOME/.local/bin/activate.sh 2>/dev/null; then
        echo '-------- AUTOENV ---------'
        echo 'Could not find ~/.local/bin/activate.sh.'
        echo 'Please check if autoenv is correctly installed.'
        echo 'In the meantime the autoenv plugin is DISABLED.'
        echo '--------------------------'
        return 1
    fi
fi

# The use_env call below is a reusable command to activate/create a new Python
# virtualenv, requiring only a single declarative line of code in your .env files.
# It only performs an action if the requested virtualenv is not the current one.

use_env() {
    typeset venv
    venv="$1"
    if [[ "${VIRTUAL_ENV:t}" != "$venv" ]]; then
        if workon | grep -q "$venv"; then
            workon "$venv"
        else
            echo -n "Create virtualenv $venv now? (Yn) "
            read answer
            if [[ "$answer" == "Y" ]]; then
                mkvirtualenv "$venv"
            fi
        fi
    fi
}
