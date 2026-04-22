-- lsp/yamlls.lua
return {
    cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yaml', 'yaml.docker-compose' },
    root_dir = vim.fs.root(0, { '.git', 'package.json', 'composer.json' }),
    settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
            keyOrdering = false,
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
            },
            schemas = {
                -- Hier kannst du Schemas erzwingen, falls die Automatik versagt
                -- kubernetes = "*.yaml",
            },
            validate = true,
            format = { enable = true },
        },
    },
}
