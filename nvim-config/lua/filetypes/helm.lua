-- return {
--     extension = {
--         yaml = function(path, bufnr)
--             if path:match("helmfile.*%.ya?ml") then
--                 return "helm"
--             end
--
--             if path:match("/templates/") or path:match("/charts/") then
--                 local chart_yaml = vim.fs.find("Chart.yaml", {
--                     path = vim.fs.dirname(path),
--                     upward = true,
--                     stop = vim.loop.os_homedir(),
--                 })[1]
--
--                 if chart_yaml then
--                     return "helm"
--                 end
--             end
--
--             return "yaml"
--         end,
--     },
-- }

return {
    pattern = {
        ["helmfile.*%.ya?ml"] = "helm",
        [".*/templates/.*%.ya?ml"] = function(path, bufnr)
            local chart_yaml = vim.fs.find("Chart.yaml", {
                path   = vim.fs.dirname(path),
                upward = true,
                stop   = vim.uv.os_homedir(),
            })[1]
            return chart_yaml and "helm" or "yaml"
        end,
        [".*/charts/.*%.ya?ml"] = function(path, bufnr)
            local chart_yaml = vim.fs.find("Chart.yaml", {
                path   = vim.fs.dirname(path),
                upward = true,
                stop   = vim.uv.os_homedir(),
            })[1]
            return chart_yaml and "helm" or "yaml"
        end,
    },
}
