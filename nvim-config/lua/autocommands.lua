-- Change titlesting on buffer change
vim.api.nvim_create_autocmd("DirChanged", {
    desc = "Update titlestring on buffer change",
    callback = function()
        vim.opt.titlestring = "nvim [ " .. vim.fn.getcwd() .. " ]"
    end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
