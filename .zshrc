if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

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

case ${OSTYPE} in
    darwin*)
        if (( ${+commands[brew]} )) ; then
            export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
        fi
        ;;
esac

PREVIEW_COMMAND="cat"

source "$HOME/.zsh_aliases"

complete-ssh-host() {
  local host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh -name config -type f 2>/dev/null) | command egrep -v '[*?]' | cut -d' ' -f 2- | sed 's/ /\'$'\n/g' | sed '/^$/d'| sort | fzf)"

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

(nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &) > /dev/null 2>&1
