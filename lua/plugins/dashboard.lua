vim.pack.add({

    {
        src = gh('nvimdev/dashboard-nvim'),
    },
    {
        src = gh('nvim-tree/nvim-web-devicons'),
    },
})

local dash = require('dashboard').setup({
    theme = 'hyper',
    config = {
        week_header = {
            enable = true, --boolean use a week header
        },
        disable_move = true,
    }, -- config used for theme
})
