vim.pack.add {

    {
        src = 'https://github.com/nvimdev/dashboard-nvim',
    },
    {
        src = 'https://github.com/nvim-tree/nvim-web-devicons',
    },
}

local dash = require('dashboard').setup {
    theme = 'hyper',
    config = {
        week_header = {
            enable = true, --boolean use a week header
        },
    }, -- config used for theme
}
