
#zplug {{{
export ZPLUG_HOME="$HOME/.zplug/"
if [ ! -d $ZPLUG_HOME ] ; then
    mkdir $ZPLUG_HOME
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
source $ZPLUG_HOME/init.zsh
zplug "mafredri/zsh-async", use:async.zsh, from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-syntax-highlighting', use:zsh-syntax-highlighting.zsh, defer:2, from:github, lazy:true
zplug 'zsh-users/zsh-completions', from:github, use:'src/_*', lazy:true
zplug "motemen/ghq", as:command, from:gh-r, rename-to:ghq, lazy:true
zplug "peco/peco", as:command, from:gh-r, rename-to:peco, lazy:true
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read  -q; then
        echo; zplug install
    fi
fi
zplug load
#}}}
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

