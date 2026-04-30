local M = {}

function M.active_lsps()
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if next(clients) == nil then
        return '[-]'
    end

    local client_names = {}
    for _, client in pairs(clients) do
        table.insert(client_names, client.name)
    end
    return "[" .. table.concat(client_names, '|') .. "]"
end

return M
