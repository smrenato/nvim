-- Seutp kanagawa
vim.pack.add({
    { src = 'https://github.com/ibhagwan/fzf-lua', name = 'fzf-lua' },
    {
        src = 'https://github.com/echasnovski/mini.icons',
    },
})

-- Plugin setup`
blink = require('fzf-lua').setup({
    winopts = {
        preview = {
            vertical = 'down:55%', -- up|down:siz
            horizontal = 'right:60%', -- right|left:size
            layout = 'horizontal', -- horizontal|vertical|flex}
        },
    },
})

local function map(mode, keys, func, opts)
    if mode == nil then
        mode = { 'n' }
    end
    vim.keymap.set(mode, keys, func, opts)
end

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
