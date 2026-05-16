require("nvim-treesitter").setup({
	ensure_installed = {"html", "css", "vue", "javascript", "javascriptreact", "typescript", "typescriptreact"},

	auto_install = false,

	highlight = { enable = true },

	indent = { enable = true },
})
