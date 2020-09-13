#!/bin/bash

set -x

if ! command -v brew &> /dev/null
then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
fi

brew install \
    asdf \
    gnupg \
    the_silver_searcher \
    fzf \
    neovim \
    kubernetes-cli \
    helm \
    coreutils \
    git \
    zsh \
    zsh-completions \
    bash-completion \
    gettext \
    jq \
    ruby-build \
    wget \
    terraform \
    aws-google-auth \
    mysql
