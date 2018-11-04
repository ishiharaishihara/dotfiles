eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec
autoload -Uz compinit
compinit
bindkey -v
setopt correct
setopt nobeep
setopt HIST_IGNORE_DUPS

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tatsuki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/tatsuki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tatsuki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/tatsuki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

#dot
export DOT_REPO="https://github.com/ishiharaishihara/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles"
fpath=($HOME/.zsh/dot $fpath)  # <- for completion
source $HOME/.zsh/dot/dot.sh
