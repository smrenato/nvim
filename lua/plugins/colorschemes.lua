return {
    {
        'rebelot/kanagawa.nvim',
        enabled = false,
        branch = 'master',
        priority = 1000,
        lazy = false,
        build = ':KanagawaCompile',
        config = function()
            vim.cmd('colorscheme kanagawa')
        end,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                auto_integrations = true,
            })

            vim.cmd('colorscheme catppuccin-mocha')
        end,
    },
}
