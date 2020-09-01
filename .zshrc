if [ ! -d "${PYENV_ROOT}" ]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi
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
case ${OSTYPE} in
    darwin*)
        if (( ${+commands[brew]} )) ; then
            export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
        fi
        ;;
esac

if type bat > /dev/null;then
    alias cat='bat'
fi

if type lsd > /dev/null;then
    alias ls='lsd'
elif [ ls --version | grep GNU > /dev/null ];then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

alias repos='ghq list -p | fzf --preview "cat {}/README.md"'

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
