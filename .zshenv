export LANG=en_US.UTF-8
export KCODE=u

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GHQ_ROOT="$HOME/workspace"
export GOPATH="$HOME/go"
export VOLTA_HOME="$HOME/.volta"

path=(
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/local/opt/grep/libexec/gnubin(N-/)
    /opt/homebrew/opt/mysql-client/bin(N-/)
    /opt/homebrew/opt/openjdk/bin(N-/)
    $HOME/bin(N-/) 
    $HOME/.config/composer/vendor/bin(N-/) 
    $HOME/.local/bin(N-/) 
    $HOME/.tfenv/bin(N-/)
    $GOPATH/bin(N-/)
    $VOLTA_HOME/bin(N-/)
    $path
)

manpath=(
    /usr/local/opt/grep/libexec/gnuman(N-/)
)

if type nvim > /dev/null;then
    EDITOR=nvim
else
    EDITOR=vim
fi
