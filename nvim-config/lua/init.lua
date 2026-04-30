-- [[ Setting configs ]]
require("config.settings")
require("keymap")
require("autocommands")

-- [[ Load custom filetype detection ]]
require("config.ftdetect.ansible")
require("config.ftdetect.helm")

-- [[ Load treesitter configs ]]
require("config.treesitter")

-- [[ Load lsp configs ]]
require("config.lsp")

-- [[ Initialize lz.n ]]
require("config.lz-n")

-- [[ Load blink.cmp config ]]
require("config.blink-cmp")

-- vim: ts=2 sts=2 sw=2 et
