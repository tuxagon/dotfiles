local toggle = {}

function toggle.relativenumber()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

function toggle.wrap()
  vim.opt.wrap = not vim.opt.wrap:get()
end

return toggle
