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
    sections = {
        lualine_c = {
            { 'filename', path = 1 }, -- 0 = filename, 1 = relative path, 2 = absolute path
        },
    },
})

vim.o.cmdheight = 0
vim.o.cmdwinheight = 1
