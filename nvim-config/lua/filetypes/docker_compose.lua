local filetype = "yaml.docker-compose"

return {
    filename = {
        ["docker-compose.yml"]  = filetype,
        ["docker-compose.yaml"] = filetype,
        ["compose.yml"]         = filetype,
        ["compose.yaml"]        = filetype,
    },
    pattern = {
        ["docker%-compose%..*%.ya?ml"] = filetype,
    },
}
