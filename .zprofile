#nvm {{{
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.}nvm"
#}}}

#pyenv {{{
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
#}}}

#dot {{{
export DOT_REPO="https://github.com/ishiharaishihara/dotfiles.git"
export DOT_DIR="$HOME/workspace/dotfiles/"
fpath=($DOT_HOME $fpath)  # <- for completion
#}}}
#


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

