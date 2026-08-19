require("flutter-tools").setup({
	lsp = {
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			renameFilesWithClasses = "prompt",
			enableSnippets = true,
			updateImportsOnRename = true,
		},
	},
	widget_guides = {
		enabled = true,
	},
	dev_log = {
		enabled = true,
		open_cmd = "tabedit",
	},
})

if vim.lsp.document_color and vim.lsp.document_color.enable then
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and client.name == "dartls" then
				vim.lsp.document_color.enable(true, { bufnr = args.buf })
			end
		end,
	})
end
