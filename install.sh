#!/bin/bash
set -Ceu

DOTPATH=~/.dotfiles
REPO_NAME="ishiharaishihara/dotfiles"
DOTFILES_URL="https://github.com/${REPO_NAME:?}"

is_exists(){
    type "$1" > /dev/null 2>&1
}
 
ESC=$(printf '\033')
RESET="${ESC}[0m"
BOLD="${ESC}[1m"
RED="${ESC}[31m"
WHITE="${ESC}[37m"


if [ -d "$DOTPATH" ]; then
    printf "${RED}${BOLD}FAILED: dotfiles is already exists${RESET}\n"
    exit 1
fi

printf "${WHITE}${BOLD}DOWNLODING...${RESET}\n"

if is_exists "git"; then
    git clone --recursive "$DOTFILES_URL" "$DOTPATH"
else
    local tarball="${DOTFILES_URL}/archive/master.tar.gz"
    if is_exists "curl"; then
        curl -L "$tarball"
    elif is_exists "wget"; then
        wget -O - "$tarball"
    fi | tar xvz
    if [ ! -d dotfiles-master ]; then
        printf "${RED}${BOLD}FAILED: dotfiles-master is not found${RESET}"
        exit 1
    fi
    mv -f dotfiles-master "$DOTPATH"
fi

make install
