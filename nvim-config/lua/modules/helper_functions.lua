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

function M.clipboard_switch()
    if vim.fn.has("wsl") == 1 then
        -- use windows system clipboard
        vim.g.clipboard = {
            name          = "WslClipboard",
            copy          = {
                ["+"] = "clip.exe",
                ["*"] = "clip.exe",
            },
            paste         = {
                ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r`n", "`n"))',
                ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r`n", "`n"))',
            },
            cache_enabled = 0,
        }
    else
        -- use wayland compositor clipboard
        vim.g.clipboard = {
            name          = "wl-clipboard",
            copy          = {
                ["+"] = "wl-copy",
                ["*"] = "wl-copy --primary",
            },
            paste         = {
                ["+"] = { "wl-paste", "--no-newline" },
                ["*"] = { "wl-paste", "--no-newline", "--primary" },
            },
            cache_enabled = 1,
        }
    end
end

return M
