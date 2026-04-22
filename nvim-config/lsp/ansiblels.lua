return {
    cmd = { "ansible-language-server", "--stdio" },
    filetypes = { "ansible", "yaml.ansible" },
    root_dir = vim.fs.root(0, { "ansible.cfg", ".ansible-lint", "inventory", "playbooks" }),
    settings = {
        ansible = {
            ansible = { path = "ansible" },
            executionEnvironment = { enabled = false },
            python = { interpreterPath = "python3" },
            validation = { enabled = true, lint = { enabled = true, path = "ansible-lint" } },
        },
    },
}
