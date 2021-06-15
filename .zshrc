
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    pick"async.zsh" src"pure.zsh" \
        sindresorhus/pure \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    zdharma/fast-syntax-highlighting \

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions 

### End of Zinit's installer chunk

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
        if type curl > /dev/null; then
            curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        elif type wget > /dev/null; then
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

PREVIEW_COMMAND="cat"
if type bat > /dev/null;then
    alias cat='bat'
    PREVIEW_COMMAND="bat --color=always"
fi

if type gsed > /dev/null;then
    alias sed='gsed'
fi

if type gxargs > /dev/null;then
    alias xargs='gxargs'
fi

if type lsd > /dev/null;then
    alias ls='lsd'
elif [ ls --version | grep GNU > /dev/null ];then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

alias repos='ghq list -p | fzf --preview "'"${PREVIEW_COMMAND}"' {}/README.md"'
alias gip='curl inet-ip.info'

complete-ssh-host() {
  local host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh -name config -type f 2>/dev/null) | command egrep -v '[*?]' | cut -d' ' -f 2- | sed 's/\\s/\'$'\n/g' | sort | fzf)"

  if [ ! -z "$host" ]; then
    LBUFFER+="$host"
  fi
  zle reset-prompt
}
zle -N complete-ssh-host

repo() {
    local dir="$(repos)"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}
eval `dircolors -b`
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

bindkey -v
bindkey '^s^s' complete-ssh-host
setopt correct
setopt nobeep
setopt HIST_IGNORE_DUPS
setopt no_flow_control
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


