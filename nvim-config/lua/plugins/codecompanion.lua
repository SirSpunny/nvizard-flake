return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			chat = { adapter = "ollama" },
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
