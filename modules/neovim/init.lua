vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.termguicolors = true
vim.o.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Delete empty file `no name` after buf read
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local bufs = vim.api.nvim_list_bufs()

		for _, buf in ipairs(bufs) do
			if
				vim.api.nvim_buf_get_option(buf, "buftype") == ""
				and vim.api.nvim_buf_get_name(buf) == ""
				and vim.api.nvim_buf_get_option(buf, "modified") == false
			then
				vim.defer_fn(function()
					vim.api.nvim_buf_delete(buf, { force = true })
				end, 500)
			end
		end
	end,
})
