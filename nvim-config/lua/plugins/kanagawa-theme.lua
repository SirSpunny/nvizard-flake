return {
    "kanagawa-nvim",
    -- colorscheme = { "kanagawa", "kanagawa-lotus", "kanagawa-wave", "kanagawa-dragon" },
    lazy = false,
    after = function()
        require("kanagawa").setup({
            theme = "dragon",
            background = {
                dark = "wave",
                light = "lotus",
            },
        })
        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
