local plugin_conf_path = vim.api.nvim_get_runtime_file("lua/filetypes", true)

for _, path in ipairs(plugin_conf_path) do
    for name, kind in vim.fs.dir(path) do
        if kind == "file" and name:match("%.lua$") then
            local module_name = "filetypes." .. name:gsub("%.lua$", "")

            local ok, config = pcall(require, module_name)
            if ok and type(config) == "table" then
                vim.filetype.add(config)
            end
        end
    end
end
