return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			chat = { adapter = "nvidia_nim" },
			inline = { adapter = "ollama" },
			agent = { adapter = "ollama" },
		},
		adapters = {
			ollama = function()
				return require("codecompanion.adapters").extend("ollama", {
					env = { url = "http://localhost:11434", },
					schema = { model = { default = "mistral-nemo", }, num_ctx = 16384 },
				})
			end,
			http = {
				nvidia_nim = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "nvidia_nim",
						env = {
							url = "https://integrate.api.nvidia.com/v1",
							api_key = "NVIDIA_NIM_API_KEY",
							chat_url = "/chat/completions",
						},
						schema = {
							model = {
								default = "mistralai/mistral-nemotron"
							},
						},
					})
				end,
			},
		},
		opts = {
			log_level = "DEBUG",
		},
	},
	keys = {
		{
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "[c]odeCompaninon [c]hat",
			mode = { "n", "v" },
		},
		{
			"<leader>ca",
			"<cmd>CodeCompanionActions<cr>",
			desc = "[c]odecompaninon [a]ctions",
			mode = { "n", "v" },
		},
	},
}
