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
    shuffle_letter = false,
    config = {
        week_header = {
            enable = true,
        },

        -- disable_move = true,
        mru = { limit = 8, label = 'recent files' },

        project = {
            limit = 5,
            icon = '󱧼 ',
            label = 'find in projects',
            action = function(path)
                require('fff').find_files_in_dir(path)
            end,
        },

        shortcut = {
            {
                desc = 'fff',
                icon = ' ',
                group = 'DashboardShortCut',
                key = 'f',
                action = function()
                    require('fff').find_files()
                end,
            },
            {
                desc = '󰊳 update',
                group = 'DashboardShortCut',
                action = function()
                    vim.pack.update()
                end,
                key = 'u',
            },
            {
                desc = 'health',
                icon = ' ',
                icon_hl = '@property',
                group = 'DashboardShortCut',
                action = function()
                    vim.cmd 'checkhealth'
                end,
                key = 'h',
            },
        },

        footer = function()
            local nv = ' ' .. tostring(vim.version()):match '%+(.-)$'
            local me = ' ' .. '@' .. vim.fn.system('git config user.name'):gsub('\n', '')
            return { '', me, nv }
        end, -- footer
    },
}

vim.keymap.set('n', '<leader>h', '<CMD>Dashboard<CR>', { desc = 'dashboard' })
