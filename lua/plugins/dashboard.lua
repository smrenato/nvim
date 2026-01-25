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
})
