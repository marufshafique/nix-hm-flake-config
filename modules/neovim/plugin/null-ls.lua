require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettier, -- for JS/TS/HTML/CSS
		require("null-ls").builtins.formatting.stylua, -- for Lua
		-- require("null-ls").builtins.formatting.black,     -- for Python
		-- add more formatters as needed
	},
})
