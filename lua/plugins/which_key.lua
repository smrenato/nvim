return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'helix',
        show_help = false,
        win = {
            height = {
                max = math.huge,
            },
        },

        spec = {
            {
                mode = { 'n', 'v' },                  -- NORMAL and VISUAL mode
                { '<leader>q', '<cmd>q<cr>', desc = 'quit' }, -- no need to specify mode since it's inherited
                { '<leader>w', '<cmd>w<cr>', desc = 'write' },
            },
        },
    },

    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
}
