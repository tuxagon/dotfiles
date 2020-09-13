###############################################################################
#
# oh-my-zsh configuration
#
###############################################################################

# Set oh-my-zsh installation path
export ZSH=/Users/kennethbogner/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# Custom zsh theme
ZSH_THEME="tuxagon"

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
export DOTFILE="$HOME/Code/dotfiles"

# For Perl to install DBD:MySQL (deprecated)
# export DYLD_LIBRARY_PATH="/usr/local/opt/mysql@5.6/lib/"

# path shims/overrides
export PATH="$HOME/.local/bin:$PATH"
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

. /usr/local/aws/bin/aws_zsh_completer.sh

# exercism autocompletion
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
    . ~/.config/exercism/exercism_completion.zsh
fi

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

###############################################################################
#
# external scripts and custom tool configuration
#
###############################################################################

source $HOME/.bash_profile

# secrets
source $HOME/.secrets

# nvm setup (deprecated in favor of asdf)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# This loads nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# The only purpose of this script is to light up my keyboard on macos when it
# gets plugged in
if [ -z "$(find $HOME/Applications -name 'led-backlight-cmstorm')" ]; then
  curl -L https://raw.githubusercontent.com/gholker/led-backlight-cmstorm/master/install.sh | sh
fi
if [ -n "$(ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*' | grep -e 'USB KEYBOARD')" ]; then
  $HOME/Applications/led-backlight-cmstorm >> /dev/null
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/kennethbogner/.asdf/installs/nodejs/8.10.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/kennethbogner/.asdf/installs/nodejs/8.10.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/kennethbogner/.asdf/installs/nodejs/8.10.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/kennethbogner/.asdf/installs/nodejs/8.10.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/kennethbogner/Code/playground/dynamo/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/kennethbogner/Code/playground/dynamo/node_modules/tabtab/.completions/slss.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kennethbogner/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kennethbogner/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kennethbogner/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kennethbogner/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
