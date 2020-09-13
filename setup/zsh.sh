#!/bin/bash

set -x

if ! command -v zsh
then
  curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
fi

mkdir -p "$HOME/.zsh"

cp zsh/.zshrc "$HOME/"
cp -r zsh/.zsh/completion "$HOME/.zsh/"
cp -a zsh/.zsh/custom/. "$HOME/.oh-my-zsh/custom/"

