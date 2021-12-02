--[[-----------------------------------------------------------------------
-- Setup
--]]
-----------------------------------------------------------------------

Plug "preservim/nerdtree"
Plug "Xuyuanp/nerdtree-git-plugin"
Plug "ryanoasis/vim-devicons"
Plug "tiagofumo/vim-nerdtree-syntax-highlight"

--[[-----------------------------------------------------------------------
-- Settings
--]]
-----------------------------------------------------------------------

vim.NERDTreeShowHidden = 1
vim.NERDTreeMinimalUI = 1

vim.g.NERDTreeIgnore = {}
vim.g.NERDTreeStatusLine = ""
vim.g.NERDTreeDirArrowExpandable = "▹"
vim.g.NERDTreeDirArrowCollapsible = "▿"

map("n", "<leader>n", ":NERDTreeFocus<cr>")
map("n", "<C-n>", ":NERDTree<cr>")
map("n", "<C-t>", ":NERDTreeToggle<cr>")
map("n", "<C-f>", ":NERDTreeFind<cr>")

-- Start NERDTree when Vim is started without file arguments.
vim.api.nvim_exec(
  [[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
]],
  false
)

-- If more than one window and previous buffer was NERDTree, go back to it.
vim.api.nvim_exec(
  [[
  autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
]],
  false
)

-- If NERDTree is the last buffer, close vim
vim.api.nvim_exec(
  [[
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]],
  false
)

-- Avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
vim.g.plug_window = "noautocmd vertical topleft new"

vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.DevIconsEnableFoldersOpenClose = 1
vim.g.DevIconsEnableFolderExtensionPatternMatching = 1
