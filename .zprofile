#nvm {{{
export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.}nvm"
if type brew > /dev/null 2>&1; then
    source $(brew --prefix nvm)/nvm.sh
else
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi
#}}}

#pyenv {{{
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#}}}

#dot {{{
export DOT_HOME="$HOME/.zsh/dot/"
[ ! -d $DOT_HOME ] && git clone 'https://github.com/ssh0/dot' $DOT_HOME
export DOT_REPO="https://github.com/ishiharaishihara/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles/"
fpath=($DOT_HOME $fpath)  # <- for completion
source $DOT_HOME/dot.sh
#}}}

case ${OSTYPE} in
    darwin*)
        alias ls='ls -G'
        ;;
    linux*)
        alias ls='ls --color=auto'
        ;;
esac

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

