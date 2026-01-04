vim.pack.add({
    { src = gh('folke/which-key.nvim') },
})

local whichkey = require('which-key').setup({
    preset = 'helix',
    show_help = false,
    win = {
        height = {
            max = math.huge,
        },
    },

    spec = {
        {
            mode = { 'n', 'v' }, -- NORMAL and VISUAL mode
            { '<leader>q', '<cmd>q<cr>', desc = 'quit' }, -- no need to specify mode since it's inherited
            { '<leader>w', '<cmd>w<cr>', desc = 'write' },
        },
    },
})
