vim.pack.add {
    {
        src = 'https://github.com/catppuccin/nvim',
        name = 'catppuccin',
    },
}

local catppuccin = require('catppuccin').setup {
    no_underline = true, -- Force no underline
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        underlines = {
            errors = { 'underline' },
            --         hints = { '' },
            warnings = { 'underline' },
            --         information = { 'underline' },
            --         ok = { 'underline' },
        },
        inlay_hints = {
            background = true,
        },
    },
}

-- if all have done
vim.cmd.colorscheme 'catppuccin-mocha'
