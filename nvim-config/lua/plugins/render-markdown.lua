return {
    "render-markdown-nvim",
    ft = { "markdown", "codecompanion" },
    before = function()
        vim.cmd.packadd("nvim-web-devicons")
    end,
    after = function()
        require("render-markdown").setup({
            file_types = { "markdown", "codecompanion" },
            heading = {
                icons = { "█ ", "██ ", "███ ", "████ ", "█████ ", "██████ ", },
            },
        })
    end,
}
