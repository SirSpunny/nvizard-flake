-- attach treesitter parsers
local parser_path = os.getenv("NVIM_TREESITTER_PARSERS")
if parser_path then
    vim.opt.runtimepath:append(parser_path)
end

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local bufnr = args.buf
        if vim.bo[bufnr].buftype ~= "" then return end -- only on files

        local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
        if not lang then return end -- only if treesitter language exists

        vim.treesitter.start(bufnr, lang)
    end,
})
