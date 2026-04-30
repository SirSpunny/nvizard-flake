local blink = require("blink.cmp")

blink.setup({
    keymap = { preset = 'enter' },

    appearance = {
        nerd_font_variant = 'mono'
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = {
                border = 'rounded',
            }
        },
        menu = {
            border = 'rounded',
            draw = {
                columns = { { "kind_icon", gap = 1 }, { "label", "label_description", gap = 1 }, },
                components = {
                    label = {
                        text = function(ctx)
                            return require("colorful-menu").blink_components_text(ctx)
                        end,
                        highlight = function(ctx)
                            return require("colorful-menu").blink_components_highlight(ctx)
                        end,
                    },
                },
                treesitter = { 'lsp' }
            },
        },
        ghost_text = {
            enabled = true
        }
    },

    sources = {
        default = { 'lsp', 'path', 'buffer' },
        per_filetype = { "codecompanion" }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
})

-- LSP Capabilities Integration
local blink_caps = blink.get_lsp_capabilities()
local default_caps = vim.lsp.protocol.make_client_capabilities()
vim.lsp.protocol.make_client_capabilities = function()
    return vim.tbl_deep_extend('force', default_caps, blink_caps)
end
