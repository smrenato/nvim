-- better formatter

return {
    'stevearc/conform.nvim',
    opts = {
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
            -- conf files
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
        },
        --
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
    init = function()
        -- Use conform for gq.
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

        -- Start auto-formatting by default (and disable with my ToggleFormat command).
        vim.g.autoformat = true
    end,
}
