-- [[ Setting configs ]]
require("config.globals")
require("config.options")
require("keymap")
require("autocommands")

-- [[ Load custom filetype detection ]]
require("config.ftdetect.ansible")
require("config.ftdetect.helm")

-- [[ Load treesitter configs ]]
require("config.treesitter")

-- [[ Load lsp configs ]]
require("config.lsp")

-- [[ Load lazy.nvim for plugin management ]]
require("config.lazy")

-- apply colorscheme
vim.cmd.colorscheme("mellow")

-- vim: ts=2 sts=2 sw=2 et
