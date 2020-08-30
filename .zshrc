eval "$(pyenv init -)"
#nvm lazy load {{{
nvm() {
    unset -f nvm
    local script_path="${NVM_DIR:-$HOME/.nvm}/nvm.sh"
    echo ${script_path}
    if [ ! -e "${script_path}" ]; then
        if is_exists "curl"; then
            curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        elif is_exists "wget"; then
            wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        else
          echo >&2 'You need curl, or wget'
          exit 1
        fi
    fi
    source "${NVM_DIR}/nvm.sh"
    nvm "$@"
}

#}}}
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
zplug "heppu/gkill", as:command, from:gh-r, rename-to:gkill, lazy:true, from:github
zplug "squizlabs/PHP_CodeSniffer", as:command, lazy:true, use:"bin/*" from:github
zplug "zplug/zplug", hook-build:"zplug --self-manage"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read  -q; then
        echo; zplug install
    fi
fi

ghq-list(){
    find -E $GHQ_ROOT -name .git -exec dirname {} + -maxdepth 7 -type d -not -iregex "(vendor|node_modules)" | sed -e "s#$GHQ_ROOT##g"
}

_is_installed(){
    zplug list | grep -q "$@"
}

zplug load



#}}}
case ${OSTYPE} in
    darwin*)
        if (( ${+commands[brew]} )) ; then
            export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
        fi
        ;;
esac
alias ls='ls --color=auto'
alias repos='ghq-list | peco'

repo() {
    local dir="$(repos)"
    if [ ! -z "$dir" ] ; then
        cd "$GHQ_ROOT/$dir"
    fi
}
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

