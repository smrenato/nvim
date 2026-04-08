vim.pack.add({
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
})

local gitsigns = require('gitsigns').setup({
    signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '▎' },
        topdelete = { text = '▎' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
    },

    signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '▎' },
        topdelete = { text = '▎' },
        changedelete = { text = '▎' },
    },

    current_line_blame = true,
    gh = true,

    on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
            vim.keymap.set(
                mode,
                l,
                r,
                { buffer = buffer, desc = desc, silent = true }
            )
        end

        map('n', ']h', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gs.nav_hunk('next')
            end
        end, 'next hunk')

        map('n', '[h', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gs.nav_hunk('prev')
            end
        end, 'prev hunk')

        map('n', ']H', function()
            gs.nav_hunk('last')
        end, 'last hunk')

        map('n', '[H', function()
            gs.nav_hunk('first')
        end, 'first hunk')

        map(
            { 'n', 'x' },
            '<leader>ghs',
            ':Gitsigns stage_hunk<CR>',
            'stage hunk'
        )
        map(
            { 'n', 'x' },
            '<leader>ghr',
            ':Gitsigns reset_hunk<CR>',
            'reset hunk'
        )
        map('n', '<leader>ghS', gs.stage_buffer, 'stage buffer')
        map('n', '<leader>ghu', gs.undo_stage_hunk, 'undo stage hunk')
        map('n', '<leader>ghR', gs.reset_buffer, 'reset buffer')
        map('n', '<leader>ghp', gs.preview_hunk_inline, 'preview hunk inline')

        map('n', '<leader>ghb', function()
            gs.blame_line({ full = true })
        end, 'blame line')

        map('n', '<leader>ghB', function()
            gs.blame()
        end, 'blame buffer')

        map('n', '<leader>ghd', gs.diffthis, 'diff this')

        map('n', '<leader>ghD', function()
            gs.diffthis('~')
        end, 'diff this ~')

        -- Toggles
        map(
            'n',
            '<leader>gtb',
            gs.toggle_current_line_blame,
            'toggle blame current line'
        )
        map('n', '<leader>gtw', gs.toggle_word_diff, 'toggle diff word')

        -- Text objects
        map({ 'o', 'x' }, 'ih', gs.select_hunk, 'select hunk')
    end,
})
