
#zplug {{{
export ZPLUG_HOME="$HOME/.zplug"

if [ ! -d $ZPLUG_HOME ] ; then
    mkdir $ZPLUG_HOME
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh
zplug "mafredri/zsh-async", use:async.zsh, from:github
zplug 'sindresorhus/pure', use:pure.zsh, as:theme, from:github
zplug 'zsh-users/zsh-syntax-highlighting', use:zsh-syntax-highlighting.zsh, defer:2, lazy:true, from:github
zplug 'zsh-users/zsh-completions', use:'src/_*', lazy:true, from:github
zplug "motemen/ghq", as:command, from:gh-r, rename-to:ghq, lazy:true, from:github
zplug "peco/peco", as:command, from:gh-r, rename-to:peco, lazy:true, from:github
zplug "creationix/nvm", use:nvm.sh, from:github
zplug "ssh0/dot", use:"*.sh" , from:github
zplug "pyenv/pyenv", as:command, use:"bin/*" from:github
zplug "squizlabs/PHP_CodeSniffer", as:command, lazy:true, use:"bin/*" from:github
zplug "zplug/zplug", hook-build:"zplug --self-manage"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read  -q; then
        echo; zplug install
    fi
fi

_is_installed(){
    zplug list | grep -q "$@"
}

zplug load

if _is_installed 'pyenv/pyenv'; then
    export PYENV_ROOT="$ZPLUG_HOME/repos/pyenv/pyenv"
    eval "$(pyenv init -)"
fi


#}}}
case ${OSTYPE} in
    darwin*)
        if (( ${+commands[brew]} )) ; then
            export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
        fi
        ;;
esac
alias ls='ls --color=auto'
alias repos='ghq list -p | peco'
alias repo='cd $(repos)'
eval `dircolors -b`
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

bindkey -v
setopt correct
setopt nobeep
setopt HIST_IGNORE_DUPS

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tatsuki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/tatsuki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tatsuki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/tatsuki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

