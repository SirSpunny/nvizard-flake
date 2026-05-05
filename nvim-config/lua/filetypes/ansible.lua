local filetype = "yaml.ansible"

return {
    pattern = {
        -- Erkennt YAML-Dateien in typischen Ansible-Ordnern als ansible
        [".*/host_vars/.*%.ya?ml"] = filetype,
        [".*/group_vars/.*%.ya?ml"] = filetype,
        [".*/group_vars/.*/.*%.ya?ml"] = filetype,
        [".*/playbooks/.*%.ya?ml"] = filetype,
        [".*/roles/.*/tasks/.*%.ya?ml"] = filetype,
        [".*/roles/.*/handlers/.*%.ya?ml"] = filetype,
        [".*/tasks/.*%.ya?ml"] = filetype,
        -- Spezifische Dateinamen
        ["site%.ya?ml"] = filetype,
        ["main%.ya?ml"] = filetype,
        ["local%.ya?ml"] = filetype,
    },
}
