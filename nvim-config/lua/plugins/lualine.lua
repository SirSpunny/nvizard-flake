return {
    "lualine-nvim",
    lazy = false,
    before = function()
        vim.cmd.packadd("nvim-web-devicons")
    end,
    after = function()
        local custom_funcs = require("modules.helper_functions")
        require("lualine").setup({
            options = {
                component_separators = '',
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = { 'snacks_dashboard' }
                },
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename', 'branch' },
                lualine_c = { '%=', },
                lualine_x = { 'diagnostics' },
                lualine_y = { 'filetype', { custom_funcs.active_lsps }, 'encoding', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        })
    end,
}
