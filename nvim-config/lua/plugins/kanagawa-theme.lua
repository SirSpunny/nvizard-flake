return {
    "kanagawa-nvim",
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
