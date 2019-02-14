#nvm {{{
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.}nvm"
source $(brew --prefix nvm)/nvm.sh
#}}}

#pyenv {{{
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#}}}

#dot {{{
export DOT_REPO="https://github.com/ishiharaishihara/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles"
fpath=($HOME/.zsh/dot $fpath)  # <- for completion
source $HOME/.zsh/dot/dot.sh
#}}}

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

