-- [[ autoload LSPs ]]
local lsp_path = vim.api.nvim_get_runtime_file("lsp/*.lua", true)
for _, file in ipairs(lsp_path) do
    local name = file:match("([^/]+)%.lua$")

    if name then
        vim.lsp.enable(name)
    end
end
