--[[-----------------------------------------------------------------------
-- Setup
--]]
-----------------------------------------------------------------------

Plug("dracula/vim", { ["as"] = "dracula" })

--[[-----------------------------------------------------------------------
-- Settings
--]]
-----------------------------------------------------------------------

vim.api.nvim_exec(
  [[
  augroup DraculaOverrides
      autocmd!
      autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
      autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
      autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
      autocmd User PlugLoaded ++nested colorscheme dracula
  augroup end
]],
  false
)
