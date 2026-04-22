return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- use lsp if available and no override exists
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			sh = { "shfmt" },
		},
		format_on_save = { timeout_ms = 500 },
		formatters = {
			shfmt = {
				append_args = { "-i", "2" },
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			desc = "[f]ormat buffer",
		},
	},
}
