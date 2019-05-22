# original: $HOME/.oh-my-zsh/custom/alias.zsh

# copy and changes to dotfiles to repo
function dotfile_update() {
  cp -r $ZSH/custom $HOME/.zsh
  cp -r $HOME/.zsh $DOTFILE
  cp $HOME/.zshrc $DOTFILE
  cp $HOME/.asdfrc $DOTFILE
  cp $HOME/.vimrc $DOTFILE
  cp $HOME/.irbrc $DOTFILE
  cp $HOME/.chunkwmrc $DOTFILE
  cd $DOTFILE
  git add .
  git commit -m "updated dotfiles"
  git push origin master
  cd -
}

alias zcdp="rm $HOME/.zcompdump*"
alias srcz="source $HOME/.zshrc"
alias fvim="vim \$(fzf)"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

# open vscode
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

function asdf_postgres_start_966 {
  pg_ctl -D "$HOME/.asdf/installs/postgres/9.6.6/data/" start
}
