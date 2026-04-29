-- attach treesitter parsers
local parser_path = os.getenv("NVIM_TREESITTER_PARSERS")
if parser_path then
    vim.opt.runtimepath:append(parser_path)
end

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local bufnr = args.buf
        if vim.bo[bufnr].buftype ~= "" then return end -- only on files

        local ft = vim.bo[bufnr].filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft

        local success = pcall(vim.treesitter.start, bufnr, lang)
        if not success then
            vim.api.nvim_buf_call(bufnr, function()
                vim.cmd("syntax on")
            end)
        end
    end,
})
