vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

-- Use spaces instead of tabs
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2      -- number of spaces a <Tab> counts for
vim.opt.shiftwidth = 2   -- spaces used for autoindent
vim.opt.softtabstop = 2  -- spaces inserted when pressing Tab

vim.o.termguicolors = true
vim.o.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true


-- require('ts-comments').setup()
require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

require("Comment").setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
