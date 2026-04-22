return {
    cmd = { 'nil' },
    filetypes = { 'nix' },
    root_dir = vim.fs.root(0, { 'flake.nix', '.git' }),
    settings = {
        ['nil'] = {
            formatting = { command = { "alejandra" } },
            nix = {
                flake = {
                    autoArchive = true,
                },
            },
        },
    },
}
