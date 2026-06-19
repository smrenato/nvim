-- Install with: cargo install --features lsp --locked taplo-cli

---@type vim.lsp.Config
return {
    cmd = { 'taplo', 'lsp', 'stdio' },
    filetypes = { 'toml' },
    root_markers = { '.taplo.toml', 'taplo.toml', '.git' },
    settings = {
        taplo = {
            configFile = { enabled = true },
            schema = {
                enabled = true,
                catalogs = {
                    'https://www.schemastore.org/api/json/catalog.json',
                },
                cache = {
                    memoryExpiration = 60,
                    diskExpiration = 600,
                },
            },
        },
    },
}
