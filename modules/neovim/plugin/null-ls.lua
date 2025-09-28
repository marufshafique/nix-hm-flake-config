-- local u = require("null-ls.utils")

require("null-ls").setup({
	-- root_dir = u.root_pattern(
	-- 	".null-ls-root", -- custom root marker
	-- 	".eslintrc.js", -- eslint config
	-- 	"package.json", -- node project
	-- 	".git" -- fallback
	-- ),
	sources = {
		-- require("none-ls.diagnostics.eslint"),,
		require("null-ls").builtins.formatting.prettier, -- for JS/TS/HTML/CSS
		require("null-ls").builtins.formatting.stylua, -- for Lua
	},
})
