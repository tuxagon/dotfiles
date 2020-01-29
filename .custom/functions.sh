#!/bin/sh

dotfile_update() {
  cp -r ~/.config/i3 ~/code/dotfiles/.config/
  cp -r ~/.config/nvim ~/code/dotfiles/.config/
  cp -r ~/scripts ~/code/dotfiles
  cp -r ~/.custom/ ~/code/dotfiles
  cp ~/.ocamlinit ~/code/dotfiles
  cp ~/.zshrc ~/code/dotfiles
}
