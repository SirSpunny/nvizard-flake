-- [[ setting configs ]]
require("config.settings")
require("keymap")
require("autocommands")

-- [[ dynamic configs ]]
require("modules.helper_functions").clipboard_switch()

-- [[ load custom filetype detection ]]
require("config.filetypes")

-- [[ load lsp configs ]]
require("config.lsp")

-- [[ initialize lz.n ]]
require("config.lz-n")

-- vim: ts=2 sts=2 sw=2 et
