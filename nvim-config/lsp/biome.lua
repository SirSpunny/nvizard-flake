return {
    cmd = { "biome", "lsp-proxy" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
        "css",
        "graphql"
    },
    -- Sucht nach der biome.json oder dem Git-Root
    root_dir = vim.fs.root(0, { "biome.json", "biome.jsonc" }),
    settings = {},
}
