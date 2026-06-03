-- Setup completion
require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
	},
	sources = {
		default = { "lsp", "path", "buffer" },
	},
})

local on_attach = function(_, bufnr)
	local bufmap = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	bufmap("<leader>r", vim.lsp.buf.rename, "Rename")
	bufmap("<leader>a", vim.lsp.buf.code_action, "Code Action")

	bufmap("gd", vim.lsp.buf.definition, "Go to Definition")
	bufmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
	bufmap("gI", vim.lsp.buf.implementation, "Go to Implementation")
	bufmap("<leader>D", vim.lsp.buf.type_definition, "Go to Type Definition")

	bufmap("gr", require("telescope.builtin").lsp_references, "Go to References")
	bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
	bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

	bufmap("<leader>k", vim.lsp.buf.hover, "Hover Documentation")

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {})
end

vim.lsp.config("*", {
	on_attach = on_attach,
	capabilities = require("blink.cmp").get_lsp_capabilities({}, true),
})

vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } }, -- Fix 'undefined global vim' warnings
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

-- ESLint Server
vim.lsp.config("eslint", {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_dir = vim.fs.root(0, {
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.json",
		"eslint.config.js",
		"package.json",
		".git",
	}),
	settings = {
		codeActionOnSave = {
			enable = true,
			mode = "all",
		},
		run = "onType",
		validate = "on",
	},
})

-- Tailwind CSS Server
vim.lsp.config("tailwindcss", {
	filetypes = {
		"html",
		"css",
		"scss",
		"jsx",
		"tsx",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_dir = vim.fs.root(
		0,
		{ "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json", ".git" }
	),
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "classList", "ngClass" },
		},
	},
})

vim.lsp.config("nixd", {
	cmd = { "nixd" },
	filetypes = { "nix" },
	root_dir = vim.fs.root(0, { "flake.nix", "default.nix", ".git" }),
})

vim.lsp.config("emmet_ls", {
	filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue" },
	cmd = { "emmet-ls", "--stdio" },
	root_dir = vim.fs.root(0, { ".git" }),
})

----------------------------------------------------------------
--- Vue Language Server with TypeScript Plugin for Vue
-----------------------------------------------------------------
vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/Users/marufs/.npm-global/lib/node_modules/@vue/language-server",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
})

----------------------------------------------------------------
--- Vue Language Server with TypeScript Plugin for Vue
-----------------------------------------------------------------

vim.lsp.enable({
	"lua_ls",
	"nixd",
	"gopls",
	"ts_ls",
	"vue_ls",
	"tailwindcss",
	"eslint",
	"emmet_ls",
})
