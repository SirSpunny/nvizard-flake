return {
    "nvim-lspconfig",
    event = "VimEnter",
    after = function()
        local lsp_path = vim.api.nvim_get_runtime_file("lsp/*.lua", true)
        for _, file in ipairs(lsp_path) do
            if file:sub(1, #vim.g.flake_config_path) == vim.g.flake_config_path then
                local name = file:match("([^/]+)%.lua$")

                if name then
                    local config = dofile(file)
                    vim.lsp.config(name, config)
                    vim.lsp.enable(name)
                end
            end
        end
    end
}
