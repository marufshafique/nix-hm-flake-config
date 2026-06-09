local on_attach = function(_, bufnr)
	local bufmap = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	bufmap("<leader>r", vim.lsp.buf.rename, "Rename symbol")
	bufmap("<leader>a", vim.lsp.buf.code_action, "Code action")

	bufmap("gd", vim.lsp.buf.definition, "Go to definition")
	bufmap("gD", vim.lsp.buf.declaration, "Go to declaration")
	bufmap("gI", vim.lsp.buf.implementation, "Go to implementation")
	bufmap("<leader>D", vim.lsp.buf.type_definition, "Go to type definition")

	bufmap("gr", require("telescope.builtin").lsp_references, "Show LSP references")
	bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols, "Document symbols")
	bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")

	bufmap("<leader>k", vim.lsp.buf.hover, "Hover documentation")

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("neodev").setup({})

vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function()
		return vim.loop.cwd()
	end,
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" }, -- recognize the `vim` global
			},
		},
	},
})

-- nix nil config
vim.lsp.enable("nixd")
vim.lsp.config("nixd", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("rust_analyzer")
vim.lsp.config("rust_analyzer", {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- require("lspconfig").volar.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

vim.lsp.enable("emmet_ls")
vim.lsp.config("emmet_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("svelte")
vim.lsp.config("svelte", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("tailwindcss")
vim.lsp.config("tailwindcss", {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "css", "vue" },
})

vim.lsp.enable("gopls")
vim.lsp.config("gopls", {
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.enable("ts_ls")
vim.lsp.config("ts_ls", {
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = "/home/marufs/.npm-global/lib/node_modules/@vue/typescript-plugin",
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
