vim.pack.add {
    { src = 'https://github.com/folke/which-key.nvim' },
}

local which_key = require 'which-key'

which_key.setup {
    preset = 'helix',
    icons = { mappings = false },
    show_help = false,
    win = {
        height = {
            max = math.huge,
        },
    },

    triggers = {
        { '<auto>', mode = 'nxso' },
        { 's', mode = { 'n', 'v' } },
    },
}

which_key.add {
    {
        mode = { 'n', 'x' },
        {
            '<leader>e',
            function()
                require('oil').open_float()
            end,
            desc = 'oil explorer',
        },
    },

    -- defining groups
    {
        mode = { 'n', 'x' },

        { '<leader>', group = 'leader' },
        { '<leader>t', group = 'tabs' },
        { '<leader>c', group = 'code' },
        { '<leader>d', group = 'debug' },
        { '<leader>f', group = 'find' },
        { '<leader>g', group = 'git' },
        { '<leader>gh', group = 'hunks' },
        { '<leader>q', group = 'quit' },
        { '<leader>s', group = 'search' },
        {
            '<leader>h',
            group = 'home',
        },
        { '<leader>x', group = 'diagnostics/quickfix' },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        { 'gr', group = 'lsp' },
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
}

-- Useful keybindings
which_key.add {
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
            require('conform').format {
                lsp_format = 'fallback',
            }
        end,
        desc = 'format current file',
        -- code format
    },
}

which_key.add {
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
}

which_key.add {
    {
        mode = { 'n' },
        { 'gra', desc = 'lsp code action' },
        { 'gri', desc = 'lsp go to implementation' },
        { 'grn', desc = 'lsp rename' },
        { 'grr', desc = 'lsp find references' },
        { 'grt', desc = 'lsp type definitions' },
        { 'grx', desc = 'lsp code lens' },
    },
}
