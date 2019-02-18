autoload -Uz compinit
compinit
autoload -U promptinit; promptinit
prompt pure
bindkey -v
setopt correct
setopt nobeep
setopt HIST_IGNORE_DUPS

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/tatsuki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/tatsuki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/tatsuki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/tatsuki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
