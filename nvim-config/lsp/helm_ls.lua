return {
    cmd = { "helm_ls", "serve" },
    filetypes = { "helm" },
    root_dir = vim.fs.root(0, { "Chart.yaml" }),
}
