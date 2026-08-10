# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.pre.zsh"

#nvm {{{
export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
#}}}

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

eval "$(/opt/homebrew/bin/brew shellenv)"



# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zprofile.post.zsh"
