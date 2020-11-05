###############################################################################
#
# oh-my-zsh configuration
#
###############################################################################

# Set oh-my-zsh installation path
export ZSH=/Users/kennethbogner/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Custom zsh theme
ZSH_THEME="half-life"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  # aws
  battery
  bundler
  # capistrano
  # codeclimate
  colored-man-pages
  command-not-found
  encode64
  fzf
  gem
  git
  git-extras
  # github
  gitignore
  helm
  history
  jump
  kubectl
  # kubetail
  lol
  # mix-fast
  # mix
  rails
  rake-fast
  rake
  # redis-cli
  ruby
  # stack
  # terraform
  # vault
)

ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

###############################################################################
#
# user configuration
#
###############################################################################

# allow zsh to give me a sanity check on `rm *`
setopt RM_STAR_WAIT

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# dotfile management
export DOTFILE="$HOME/code/dotfiles"

# For Perl to install DBD:MySQL (deprecated)
# export DYLD_LIBRARY_PATH="/usr/local/opt/mysql@5.6/lib/"

# Flutter
export PATH="$PATH:$HOME/code/flutter/bin"

# path shims/overrides
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# rubygems
# export GEM_PATH="$HOME/.asdf/installs/ruby/2.4.2/lib/ruby/gems/2.4.0/gems"

# needed for gpg-agent
# https://www.gnupg.org/documentation/manuals/gnupg-devel/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty)

# android
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"

# golang
export PATH="$HOME/go/bin:$PATH"

# Mojave hack
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Percona hack
#export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include/mysql -I/usr/local/Cellar/openssl@1.1/1.1.1/include"
#export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib -L/usr/local/opt/openssl@1.1/lib"

export PATH="/usr/local/opt/openssl/bin:$PATH"

#export LDFLAGS="-L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/openssl/include"

#export LDFLAGS="-L/usr/local/opt/mysql@5.6/lib"
#export CPPFLAGS="-I/usr/local/opt/mysql@5.6/include"

# export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

###############################################################################
#
# completions
#
###############################################################################

# load any completion files under $HOME/.zsh
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

###############################################################################
#
# aliases
#
# (NOTE) other aliases are placed in $ZSH/custom/alias.zsh
#
###############################################################################

# alias credstore="$HOME/Code/operations/tools/tools credstore"
alias opstools="docker run -it --rm -v ~/.aws:/root/.aws -e AWS_PROFILE=assurant 783369351099.dkr.ecr.us-east-1.amazonaws.com/opstools"
alias credstore="opstools credstore"

alias kscapp="kubectl get pods -n server-core -o json | jq '.items[].metadata.name | select(test(\".app.\"))' | head -1 | tr -d '\"'"
alias kscsidekiq="kubectl get pods -n server-core -o json | jq '.items[].metadata.name | select(test(\".sidekiq.\"))' | head -1 | tr -d '\"'"

alias u="ultralist"
alias uc="ultralist l group:context"
alias up="ultralist l group:project"
alias ucs="ultralist l due:agenda group:context"
alias upa="ultralist l due:agenda group:project"
alias tod="ultralist l goup:project due:tod"
alias tom="ultralist l goup:project due:tom"
alias mon="ultralist l goup:project due:mon"
alias tue="ultralist l goup:project due:tue"
alias wed="ultralist l goup:project due:wed"
alias thu="ultralist l goup:project due:thu"
alias fri="ultralist l goup:project due:fri"
alias c="ultralist l completed:tod"

###############################################################################
#
# external scripts and custom tool configuration
#
###############################################################################

source $HOME/.bash_profile

# secrets
source $HOME/.secrets
