vim.pack.add({
    { src = gh('folke/which-key.nvim') },
})

local wk = require('which-key')

-- setup plugin
wk.setup({
    preset = 'helix',
    show_help = false,
    win = {
        height = {
            max = math.huge,
        },
    },

    triggers = {
        { '<auto>', mode = 'nxso' },
        -- Mini surround trigger
        { 's', mode = { 'n', 'v' } },
    },
})

--
wk.add({
    -- oil nvim
    {
        mode = { 'n', 'x' },
        {
            '<leader>e',
            function()
                require('oil').open_float()
            end,
            desc = 'Oil explorer',
            icon = { icon = '󰉋 ', color = 'red' },
        },
    },

    -- defining groups
    {
        mode = { 'n', 'x' },
        { '<leader><tab>', group = 'tabs' },
        { '<leader>c', group = 'code' },
        { '<leader>d', group = 'debug' },
        { '<leader>f', group = 'file/find' },
        { '<leader>g', group = 'git' },
        { '<leader>q', group = 'quit/session' },
        { '<leader>s', group = 'search' },
        { '<leader>x', group = 'diagnostics/quickfix' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 's', group = 'surround' },
        { 'z', group = 'fold' },
        {
            '<leader>b',
            group = 'buffer',
            expand = function()
                return require('which-key.extras').expand.buf()
            end,
        },
        {
            '<leader>w',
            group = 'windows',
            proxy = '<c-w>',
            expand = function()
                return require('which-key.extras').expand.win()
            end,
        },
    },
})

-- Useful keybindings
wk.add({

    -- Code group
    {
        mode = 'n',
        '<leader>cd',
        function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end,
        desc = 'toggle diagnostics',
    },

    {
        mode = 'n',
        '<leader>cD',
        function()
            vim.diagnostic.open_float()
        end,
        desc = 'diagnostic float',
    },
    {
        mode = 'n',
        '<leader>ch',
        function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        desc = 'toggle inlay hints',
    },
    {
        mode = 'n',
        '<leader>cf',
        function()
            require('conform').format({
                lsp_format = 'fallback',
            })
        end,
        desc = 'format current file',
        -- code format
    },
})

wk.add({
    -- Buffer
    {
        mode = 'n',
        '<leader>bb',
        '<cmd>e #<cr>',
        desc = 'switch to other buffer',
    },
    {
        mode = 'n',
        '<leader>bD',
        '<cmd>:bd<cr>',
        desc = 'delete buffer and window',
    },
    {
        mode = 'n',
        '[b',
        '<cmd>bprevious<cr>',
        desc = 'prev buffer',
    },
    { mode = 'n', ']b', '<cmd>bnext<cr>', desc = 'next buffer' },
})
