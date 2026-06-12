-- Tiny and nicer inline diagnostics
vim.pack.add {
    {
        src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
    },
}

local tiny = require('tiny-inline-diagnostic').setup {
    preset = 'ghost',
    transparent_bg = true,

    options = {
        underline = false,
        override_open_float = true,
        set_arrow_to_diag_color = true,
        multilines = {
            enabled = true,
            always_show = true,
            severity = { vim.diagnostic.severity.ERROR },
        },
    },

    signs = {
        left = '',
        right = '',
        diag = '●',
        arrow = '    ',
        up_arrow = '    ',
        vertical = ' │',
        vertical_end = ' └',
    },
    blend = {
        factor = 0.22,
    },
}
-- Helper
local map = vim.keymap.set

map('n', '<leader>de', '<cmd>TinyInlineDiag enable<cr>', { desc = 'Enable diagnostics' })
map('n', '<leader>dd', '<cmd>TinyInlineDiag disable<cr>', { desc = 'Disable diagnostics' })
map('n', '<leader>dt', '<cmd>TinyInlineDiag toggle<cr>', { desc = 'Toggle diagnostics' })
map('n', '<leader>dc', '<cmd>TinyInlineDiag toggle_cursor_only<cr>', { desc = 'Toggle cursor-only diagnostics' })
map('n', '<leader>dr', '<cmd>TinyInlineDiag reset<cr>', { desc = 'Reset diagnostic options' })
