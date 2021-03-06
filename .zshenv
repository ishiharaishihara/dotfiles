export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GHQ_ROOT="$HOME/workspace"
export PYENV_ROOT="$HOME/.pyenv"
export GOPATH="$HOME/go"

path=(
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/local/opt/grep/libexec/gnubin(N-/)
    $HOME/bin(N-/) 
    $HOME/.config/composer/vendor/bin(N-/) 
    $HOME/.local/bin(N-/) 
    $PYENV_ROOT/bin(N-/)
    $GOPATH/bin(N-/)
    $path
)

manpath=(
    /usr/local/opt/grep/libexec/gnuman(N-/)
)
EDITOR=nvim
