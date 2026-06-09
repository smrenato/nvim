-- Better formatter
vim.pack.add {
    {
        src = 'https://github.com/stevearc/conform.nvim',
    },
}
-- Plugins setup
local conform = require('conform').setup {
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
        rust = {
            name = 'rust_analyzer',
            timeout_ms = 500,
            lsp_format = 'prefer',
        },
        c = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },
        sh = { 'shfmt' },
        toml = { 'taplo' },
        json = {
            'prettier',
            name = 'dprint',
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
        jsonc = {
            'prettier',
            name = 'dprint',
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    }, --
    format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
    },
}

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.g.autoformat = true
