vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.format()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", '<cmd>Neotree toggle<cr>', { noremap = true, silent = true })
