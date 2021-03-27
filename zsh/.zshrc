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
  battery
  bundler
  colored-man-pages
  command-not-found
  encode64
  fzf
  gem
  git
  git-extras
  gitignore
  helm
  history
  jump
  kubectl
  lol
  rails
  rake-fast
  rake
  ruby
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
export EDITOR='nvim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# dotfile management
export DOTFILE="$HOME/code/dotfiles"

# For Perl to install DBD:MySQL (deprecated)
# export DYLD_LIBRARY_PATH="/usr/local/opt/mysql@5.6/lib/"

# path shims/overrides
# export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/bin:$PATH"

# needed for gpg-agent
# https://www.gnupg.org/documentation/manuals/gnupg-devel/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty)

# Mojave hack
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# export PATH="/usr/local/opt/openssl/bin:$PATH"

path=('/opt/homebrew/bin' $path)

export PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###############################################################################
#
# completions
#
###############################################################################

# load any completion files under $HOME/.zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit -i
fi

###############################################################################
#
# aliases
#
# (NOTE) other aliases are placed in $ZSH/custom/alias.zsh
#
###############################################################################

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

alias i="arch -x86_64"
alias ibrew="arch -x86_64 /usr/local/Homebrew/bin/brew"

###############################################################################
#
# external scripts and custom tool configuration
#
###############################################################################

# source $HOME/.bash_profile

# secrets
source $HOME/.secrets

. $HOME/.asdf/asdf.sh
