vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.termguicolors = true

vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.format()
end, { noremap = true, silent = true })
