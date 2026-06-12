-- Tiny and nicer inline diagnostics
vim.pack.add {
    {
        src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
    },
}

local tiny = require('tiny-inline-diagnostic').setup {
    preset = 'ghost',
    transparent_bg = false,

    options = {
        underline = false,
        override_open_float = false,
        set_arrow_to_diag_color = true,
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
