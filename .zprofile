#nvm {{{
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.}nvm"
#}}}

#dot {{{
export DOT_REPO="https://github.com/ishiharaishihara/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles/"
fpath=($DOT_HOME $fpath)  # <- for completion
#}}}
#


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

