vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.o.winborder = "rounded"

vim.opt.number = true             -- Make line numbers default
vim.opt.relativenumber = true     -- Enable relative line numbers
vim.opt.mouse = "a"               -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.showmode = false          -- Don't show the mode, since it's already in the status line
vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
vim.opt.breakindent = true        -- Enable break indent
vim.opt.undofile = true           -- Save undo history
vim.opt.ignorecase = true         -- Case-insensitive searching
vim.opt.smartcase = true          -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.signcolumn = "yes"        -- Keep signcolumn on by default
vim.opt.updatetime = 250          -- Decrease update time
vim.opt.timeoutlen = 300          -- Decrease mapped sequence wait time (Displays which-key popup sooner)
vim.opt.splitright = true         -- Configure how new splits should be opened
vim.opt.splitbelow = true
vim.opt.list = true               -- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"      -- Preview substitutions live, as you type!
vim.opt.cursorline = true         -- Show which line your cursor is on
vim.opt.scrolloff = 10            -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.hlsearch = true           -- Set highlight on search
vim.opt.title = true
vim.opt.titlestring = "nvim [ " .. vim.fn.getcwd() .. " ]"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Globales Folding über Treesitter
vim.opt.foldenable = false                           -- Dateien nicht direkt zugeklappt öffnen
