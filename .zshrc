if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
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
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node \
    zdharma/fast-syntax-highlighting \

_ssh_conf_cmp() {
  local -a hosts

  hosts=($(
    awk '
      /^Host /{
        for(i=2;i<=NF;i++)
          if($i !~ /[*?]/) print $i
      }
    ' ~/.ssh/config | sort -u
  ))

  compadd -- "${hosts[@]}"
}


#zinit wait lucid atload"zicompinit; zicdreplay; compdef _ssh_hosts ssh" blockf for \
zinit wait lucid atload"zicompinit; zicdreplay; compdef _ssh_conf_cmp ssh" blockf for \
    zsh-users/zsh-completions\
    Aloxaf/fzf-tab\

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
  local host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config | command egrep -v '[*?]' | cut -d' ' -f 2- | sed 's/ /\'$'\n/g' | sed '/^$/d'| sort | fzf)"

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
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' switch-group ',' '.'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

bindkey -v
bindkey '^s^s' complete-ssh-host
setopt correct
setopt nobeep
setopt no_flow_control

(nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' &) > /dev/null 2>&1

if which rbenv > /dev/null; then 
    eval "$(rbenv init -)"
fi


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ishihara/.lmstudio/bin"
# End of LM Studio CLI section
eval "$(atuin init zsh)"
