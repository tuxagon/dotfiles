local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  mode:gsub(".", function(m)
    vim.api.nvim_set_keymap(m, lhs, rhs, options)
  end)
end

toggle = require "toggle"

vim.g.mapleader = " "

map("n", "<leader>ve", ":edit $MYVIMRC<cr>")
map("n", "<leader>vc", ":edit ~/.config/nvim/coc-settings.json<cr>")
map("n", "<leader>vr", ":source $MYVIMRC<cr>")

map("n", "<A-h>", "<C-\\><C-n><C-w>h")
map("n", "<A-j>", "<C-\\><C-n><C-w>j")
map("n", "<A-k>", "<C-\\><C-n><C-w>k")
map("n", "<A-l>", "<C-\\><C-n><C-w>l")
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<leader>k", ":nohlsearch<cr>")
-- Allow gf to open non-existent files
map("nvo", "gf", ":edit <cfile><cr>")

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map("v", "y", "myy`y")
map("v", "Y", "myY`y")

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
map("nvo", "j", "(v:count == 0 ? 'gj' : 'j')", { silent = true, expr = true })
map("nvo", "k", "(v:count == 0 ? 'gk' : 'k')", { silent = true, expr = true })

-- Make Y behave like the other capitals
map("n", "Y", "y$")

-- Open the current file in the default program
map("n", "<leader>o", ":!open %<cr><cr>")

-- Easy insertion of a trailing ; or , from insert mode
map("i", ";;", "<esc>A;<esc>")
map("i", ",,", "<esc>A,<esc>")

map("nvo", "<leader>tn", "<cmd>lua toggle.relativenumber()<cr>")
map("nvo", "<leader>tw", "<cmd>lua toggle.wrap()<cr>")

map("n", "<leader>n", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>f", "<cmd>NvimTreeFindFileToggle<cr>")

map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>.", "<cmd>Telescope find_files<cr>")
map("n", "<leader>f", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
map("n", "<leader>:", "<cmd>Telescope commands<cr>")
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>")

map("n", "<leader>tz", "<cmd>TZAtaraxis<cr>")

map("nt", "<leader>to", "<cmd>FloatermNew<cr>")
map("n", "<leader>ts", "<cmd>FloatermShow<cr>")
map("t", "<leader>tc", "<cmd>FloatermHide<cr>")
map("t", "<leader>t0", "<cmd>FloatermFirst<cr>")
map("t", "<leader>t$", "<cmd>FloatermLast<cr>")
map("t", "<leader>t[", "<cmd>FloatermPrev<cr>")
map("t", "<leader>t]", "<cmd>FloatermNext<cr>")

vim.cmd "silent! command PackerCompile lua require 'pluginList' require('packer').compile()"
vim.cmd "silent! command PackerInstall lua require 'pluginList' require('packer').install()"
vim.cmd "silent! command PackerStatus lua require 'pluginList' require('packer').status()"
vim.cmd "silent! command PackerSync lua require 'pluginList' require('packer').sync()"
vim.cmd "silent! command PackerUpdate lua require 'pluginList' require('packer').update()"
