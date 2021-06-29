#!/bin/bash

set -x

if ! command -v nvim
then
    source ./homebrew.sh
fi

if ! test -f "$HOME/.local/share/nvim/site/autoload/plug.vim"
then
    curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

mkdir -p "$HOME/.config/nvim"

cp -a nvim/. "$HOME/.config/nvim/"

git config --global core.editor nvim
