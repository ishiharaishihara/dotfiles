export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_DATA_HOME="$HOME/.local/share/"
export XDG_CACHE_HOME="$HOME/.cache/"
path=(
    /usr/local/opt/grep/libexec/gnubin(N-/)
    /usr/local/bin(N-/)
    $HOME/bin(N-/) 
    $HOME/.config/composer/vendor/bin(N-/) 
    $HOME/.local/bin(N-/) 
    $path
)
manpath=(
    /usr/local/opt/grep/libexec/gnuman(N-/)
)
EDITOR=nvim
