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
            },
            format_on_save = { timeout_ms = 500 },
            formatters = {
                shfmt = {
                    append_args = { "-i", "2" },
                },
            },
        })

        -- The 'init' block from your lazy config
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
