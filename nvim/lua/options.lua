--[[-----------------------------------------------------------------------
-- Requires neovide
--
--   https://github.com/neovide/neovide#install
--]]
-----------------------------------------------------------------------

vim.g.did_load_filetypes = 1
vim.g.shell = "/bin/zsh"
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.floaterm_width = 0.9

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noselect"
vim.opt.confirm = true
vim.opt.cursorline = false
vim.opt.dir = "/tmp"
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " " }
vim.opt.guicursor:append "i:blinkwait700-blinkon400-blinkoff250"
vim.opt.guifont = "FantasqueSansMono Nerd Font:h14"
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,trail:·"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append "casI"
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:2"
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.spell = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.undofile = true
vim.opt.whichwrap:append "<>hl"
vim.opt.wildmode = "longest:full,full"
vim.opt.wrap = false
