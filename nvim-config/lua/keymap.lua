-- custom shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[w]rite" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "[q]uit" })

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- quality of life
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Unset highlighted search with ESC in normal mode" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Leader ?
vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "[?] Local Keymaps" })
