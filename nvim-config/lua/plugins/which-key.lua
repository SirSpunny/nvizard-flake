return {
    "which-key-nvim",
    event = "DeferredUIEnter",
    before = function()
        vim.cmd.packadd("nvim-web-devicons")
    end,
    after = function()
        require("which-key").setup({
            preset = "helix",
        })
    end,
}
