return {
    "render-markdown-nvim",
    ft = { "markdown", "codecompanion" },
    after = function()
        require("render-markdown").setup({
            file_types = { "markdown", "codecompanion" },
            heading = {
                icons = { "█ ", "██ ", "███ ", "████ ", "█████ ", "██████ ", },
            },
        })
    end,
}
