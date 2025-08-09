return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            '<leader>N',
            desc = 'Neovim News',
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = 'yes',
                        statuscolumn = ' ',
                        conceallevel = 3,
                    },
                })
            end,
        },
    },
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VeryLazy',
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle
                    .option('spell', { name = 'Spelling' })
                    :map('<leader>us')
                Snacks.toggle
                    .option('wrap', { name = 'Wrap' })
                    :map('<leader>uw')
                Snacks.toggle
                    .option('relativenumber', { name = 'Relative Number' })
                    :map('<leader>uL')
                Snacks.toggle.diagnostics():map('<leader>ud')
                Snacks.toggle.line_number():map('<leader>ul')
                Snacks.toggle
                    .option('conceallevel', {
                        off = 0,
                        on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
                    })
                    :map('<leader>uc')
                Snacks.toggle.treesitter():map('<leader>uT')
                Snacks.toggle
                    .option(
                        'background',
                        { off = 'light', on = 'dark', name = 'Dark Background' }
                    )
                    :map('<leader>ub')
                Snacks.toggle.inlay_hints():map('<leader>uh')
                Snacks.toggle.indent():map('<leader>ug')
                Snacks.toggle.dim():map('<leader>uD')
            end,
        })
    end,
}
