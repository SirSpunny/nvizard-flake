local ts_path = vim.fn.fnamemodify(vim.fn.exepath("tsc"), ":h:h") .. "/lib/node_modules/typescript/lib"

return {
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
    settings = {
        vtsls = {
            typescript = {
                tsdk = ts_path,
            },
            tsserver = {
                globalPlugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vim.g.vue_ls_typescript_plugin_path,
                        languages = { "vue" },
                        confignamespace = "typescript",
                        enableForWorkspaceTypeScriptVersions = true,
                    },

                }
            }
        },
        typescript = {
            tsserver = {
                plugin_enable = true,
            },
        },
    },
}
