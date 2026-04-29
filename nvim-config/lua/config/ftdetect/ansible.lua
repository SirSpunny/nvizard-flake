vim.filetype.add({
    pattern = {
        -- Erkennt YAML-Dateien in typischen Ansible-Ordnern als ansible
        [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
        [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
        [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
        -- Spezifische Dateinamen
        ["site%.ya?ml"] = "yaml.ansible",
        ["main%.ya?ml"] = "yaml.ansible",
        ["local%.ya?ml"] = "yaml.ansible",
    },
})
