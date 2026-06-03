require("codecompanion").setup({
	display = {
		action_palette = {
			width = 95,
			height = 10,
			prompt = "Prompt ", -- Prompt used for interactive LLM calls
			provider = "mini_pick", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
			opts = {
				show_preset_actions = true, -- Show the preset actions in the action palette?
				show_preset_prompts = true, -- Show the preset prompts in the action palette?
				title = "CodeCompanion actions", -- The title of the action palette
			},
		},
	},
	adapters = {
		copilot = function()
			return require("codecompanion.adapters").extend("copilot", {
				schema = {
					model = {
						default = "GPT-5.2-Codex", -- Or use "claude-3.5-sonnet", "gemini-2.5", etc.
					},
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
		cmd = {
			adapter = "copilot",
		},
	},
})
