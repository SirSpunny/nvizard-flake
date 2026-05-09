return {
    "conform-nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true })
            end,
            desc = "[f]ormat buffer",
        },
    },
    after = function()
        local conform = require("conform")

        conform.setup({
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_by_ft = {
                sh = { "shfmt" },
                vue = { "vue_ls", lsp_format = "first" },
            },
            format_on_save = { timeout_ms = 500 },
            formatters = {
                shfmt = {
                    append_args = { "-i", "2" },
                },
            },
        })

        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
