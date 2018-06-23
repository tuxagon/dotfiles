# copy and changes to dotfiles to repo
function dotfile_update() {
  cp -r $ZSH/custom $DOTFILE
  cp -r $HOME/.zsh $DOTFILE
  cp $HOME/.zshrc $DOTFILE
  cp $HOME/.asdfrc $DOTFILE
  cp $HOME/.vimrc $DOTFILE
  cd $DOTFILE
  git add .
  git commit -m "updated dotfiles"
  git push origin master
}

alias zcdp="rm $HOME/.zcompdump*"
alias srcz="source $HOME/.zshrc"
alias fvim="vim \$(fzf)"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"

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
