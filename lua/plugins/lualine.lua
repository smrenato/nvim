-- Lua line
vim.pack.add({
    {
        src = gh('nvim-lualine/lualine.nvim'),
        name = 'lualine',
    },
    {
        src = gh('nvim-tree/nvim-web-devicons'),
        name = 'devicons',
    },
})

-- No setup is require
lualine = require('lualine').setup({
    options = { theme = 'auto' },
    sections = {},
    disabled_buftypes = { 'oil' },
})

vim.o.cmdheight = 0
vim.o.cmdwinheight = 1
