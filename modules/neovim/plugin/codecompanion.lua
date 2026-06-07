require("codecompanion").setup({
	adapters = {
		deepseek = function()
			return require("codecompanion.adapters").extend("deepseek", {
				env = {
					api_key = os.getenv("DEEPSEEK_API_KEY"), -- Pulls securely from your shell environment
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "deepseek",
		},
		inline = {
			adapter = "deepseek",
		},
		cmd = {
			adapter = "copilot",
		},
	},
})
