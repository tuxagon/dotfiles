local modules = {
  "options",
  "mappings",
  "packer_compiled",
}

for i = 1, #modules, 1 do
  pcall(require, modules[i])
end

----
-- package.loaded.plugins = nil
-- require "plugins"

-- Automatically install vim-plug
--local data_dir = fn.has("nvim") and fn.stdpath("data") .. "/site" or "~/.vim"
--if fn.empty(fn.glob(data_dir .. "/autoload/plug.vim")) > 0 then
--  vim.api.nvim_command("!curl -fLo " .. data_dir .. "/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
--  vim.api.nvim_exec("autocmd VimEnter * PlugInstall --sync | source $MYVIMRC", false)
--end
--
--vim.call("plug#begin", data_dir .. "/plugins")

--source ~/.config/nvim/plugins/abolish.vim
--source ~/.config/nvim/plugins/airline.vim
--source ~/.config/nvim/plugins/arduino.vim
--source ~/.config/nvim/plugins/coc.vim
--source ~/.config/nvim/plugins/commentary.vim
--source ~/.config/nvim/plugins/context-commentstring.vim
--source ~/.config/nvim/plugins/dispatch.vim
--requires("plugins/dracula")
--source ~/.config/nvim/plugins/dracula.vim
--source ~/.config/nvim/plugins/editorconfig.vim
--source ~/.config/nvim/plugins/eunuch.vim
--source ~/.config/nvim/plugins/exchange.vim
--source ~/.config/nvim/plugins/firenvim.vim
--source ~/.config/nvim/plugins/floaterm.vim
--source ~/.config/nvim/plugins/fugitive.vim
--source ~/.config/nvim/plugins/fzf.vim
--source ~/.config/nvim/plugins/heritage.vim
--source ~/.config/nvim/plugins/lastplace.vim
--source ~/.config/nvim/plugins/lion.vim
--source ~/.config/nvim/plugins/markdown-preview.vim
--requires("plugins/nerdtree")
-- vim.api.nvim_exec("source ~/.config/nvim/plugins/nerdtree.lua", false)
--source ~/.config/nvim/plugins/pasta.vim
--source ~/.config/nvim/plugins/peekaboo.vim
--source ~/.config/nvim/plugins/phpactor.vim
--source ~/.config/nvim/plugins/polyglot.vim
--source ~/.config/nvim/plugins/projectionist.vim
--source ~/.config/nvim/plugins/quickscope.vim
--source ~/.config/nvim/plugins/repeat.vim
--source ~/.config/nvim/plugins/rooter.vim
--source ~/.config/nvim/plugins/sayonara.vim
--source ~/.config/nvim/plugins/smooth-scroll.vim
--source ~/.config/nvim/plugins/splitjoin.vim
--source ~/.config/nvim/plugins/surround.vim
--source ~/.config/nvim/plugins/targets.vim
--source ~/.config/nvim/plugins/textobj-xmlattr.vim
--source ~/.config/nvim/plugins/tmux-navigator.vim
--source ~/.config/nvim/plugins/unimpaired.vim
--source ~/.config/nvim/plugins/vim-test.vim
--source ~/.config/nvim/plugins/visual-multi.vim
--source ~/.config/nvim/plugins/visual-star-search.vim
--source ~/.config/nvim/plugins/which-key.vim

--vim.call("plug#end")
--vim.api.nvim_exec("doautocmd User PlugLoaded", false)
--
--vim.api.nvim_exec([[
--  augroup FileTypeOverrides
--      autocmd!
--      autocmd TermOpen * setlocal nospell
--  augroup END
--]], false)
