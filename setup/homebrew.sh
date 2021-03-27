#!/bin/bash

set -x

alias ibrew="arch -x86_64 /usr/local/Homebrew/bin/brew"

if ! command -v brew &> /dev/null
then
    arch -arm64 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
    arch -x86_64 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
fi

brew install --cask iterm2

brew install \
  neovim \
  gnupg \
  the_silver_searcher \
  fzf \
  zsh-completions \
  git \
  zsh \
  coreutils \
  jq \
  curl \
  wget \
  ultralist \
  gh

ibrew install \
  readline \
  ruby-build

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
