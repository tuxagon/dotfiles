# Path to your oh-my-zsh installation.
export ZSH=/Users/kennethbogner/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# allow zsh to give me a sanity check on `rm *`
setopt RM_STAR_WAIT

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# exercism autocompletion
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
    . ~/.config/exercism/exercism_completion.zsh
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias cpzsh="cp ~/.zshrc ~/Code/dotfiles"
alias cpvim="cp ~/.vimrc ~/Code/dotfiles"
alias cptmux="cp ~/.tmux.conf ~/Code/dotfiles"
alias srcz="source ~/.zshrc"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# For Perl to install DBD:MySQL
export DYLD_LIBRARY_PATH="/usr/local/opt/mysql@5.6/lib/"


export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The only purpose of this script is to light up my keyboard on macos when it
# gets plugged in
if [ -z "$(find $HOME/Applications -name 'led-backlight-cmstorm')" ]; then
  curl -L https://raw.githubusercontent.com/gholker/led-backlight-cmstorm/master/install.sh | sh
fi
if [ -n "$(ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*' | grep -e 'USB KEYBOARD')" ]; then
  $HOME/Applications/led-backlight-cmstorm >> /dev/null
fi

function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
