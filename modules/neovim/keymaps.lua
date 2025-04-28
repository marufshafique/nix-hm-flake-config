vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.format()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", '<cmd>Neotree toggle<cr>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

