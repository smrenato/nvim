-- Seutp fzf-lua
vim.pack.add({
    { src = gh('ibhagwan/fzf-lua'), name = 'fzf-lua' },
    {
        src = gh('echasnovski/mini.icons'),
    },
})

-- Plugin setup`
local blink = require('fzf-lua').setup({
    winopts = {
        preview = {
            vertical = 'down:55%', -- up|down:siz
            horizontal = 'right:60%', -- right|left:size
            layout = 'horizontal', -- horizontal|vertical|flex}
        },
    },
})

-- Open fzf when enter with no args
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        local a = vim.fn.argv(0)
        if vim.fn.argc() == 0 then
            -- Skip if the open as manpager
            if
                a:match('^/tmp/mandoc')
                or a:match('man%.')
                or vim.bo.filetype == 'man'
            then
                return
            end
            vim.defer_fn(function()
                require('fzf-lua').files()
            end, 30)
        end
    end,
})

-- Map keybinding to fzf
map('n', '<leader>ff', function()
    require('fzf-lua').files()
end, { desc = 'find files in project directory' })

map('n', '<leader>fg', function()
    require('fzf-lua').live_grep()
end, { desc = 'find by grepping in project directory' })

map('n', '<leader>fc', function()
    require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'find in neovim configuration' })

map('n', '<leader>fh', function()
    require('fzf-lua').helptags()
end, { desc = 'find help' })

map('n', '<leader>fk', function()
    require('fzf-lua').keymaps()
end, { desc = 'find keymaps' })

map('n', '<leader>fb', function()
    require('fzf-lua').builtin()
end, { desc = 'find builtin fzf' })

map('n', '<leader>fw', function()
    require('fzf-lua').grep_cword()
end, { desc = 'find current word' })

map('n', '<leader>fW', function()
    require('fzf-lua').grep_cWORD()
end, { desc = 'find current WORD' })

map('n', '<leader>fd', function()
    require('fzf-lua').diagnostics_document()
end, {
    desc = 'find diagnostics',
})

map('n', '<leader>fr', function()
    require('fzf-lua').resume()
end, {
    desc = 'find resume',
})

map('n', '<leader>fo', function()
    require('fzf-lua').oldfiles()
end, { desc = 'find old files' })

map('n', '<leader><leader>', function()
    require('fzf-lua').buffers()
end, { desc = ', find existing buffers' })

map('n', '<leader>/', function()
    require('fzf-lua').lgrep_curbuf()
end, { desc = '/ live grep the current buffer' })
