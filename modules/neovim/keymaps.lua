vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.format()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("n", "gl", "$", { noremap = true, silent = true })
vim.keymap.set("n", "gh", "0", { noremap = true, silent = true })
vim.keymap.set("n", "ge", "G", { noremap = true, silent = true })

vim.keymap.set("n", "mm", "%", { noremap = true, silent = true })
vim.keymap.set("n", "m", "v", { noremap = true, silent = true })


-- telescope related keymaps
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>g", "<cmd>Telescope git_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
