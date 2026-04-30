local lz = require("lz.n")
local configs = {}

local plugin_conf_path = vim.api.nvim_get_runtime_file("lua/plugins", true)
for _, path in ipairs(plugin_conf_path) do
    for name, kind in vim.fs.dir(path) do
        if kind == "file" and name:match("%.lua$") and name ~= "init.lua" then
            local module_name = "plugins." .. name:gsub("%.lua$", "")

            local ok, config = pcall(require, module_name)
            if ok and type(config) == "table" then
                table.insert(configs, config)
            end
        end
    end
end

lz.load(configs)
