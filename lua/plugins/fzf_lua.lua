-- Seutp fzf-lua
vim.pack.add({
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    {
        src = 'https://github.com/echasnovski/mini.icons',
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

-- -- Open fzf when enter with no args
-- vim.api.nvim_create_autocmd('VimEnter', {
--     callback = function()
--         local a = vim.fn.argv(0)
--         if vim.fn.argc() == 0 then
--             -- Skip if the open as manpager
--             if
--                 a:match('^/tmp/mandoc')
--                 or a:match('man%.')
--                 or vim.bo.filetype == 'man'
--             then
--                 return
--             end
--             vim.defer_fn(function()
--                 require('fzf-lua').files()
--             end, 30)
--         end
--     end,
-- })

-- Map keybinding to fzf
vim.keymap.set('n', '<leader>ff', function()
    require('fzf-lua').files()
end, { desc = 'files in project directory' })

vim.keymap.set('n', '<leader>fg', function()
    require('fzf-lua').live_grep()
end, { desc = 'grep files in project directory' })

vim.keymap.set('n', '<leader>fc', function()
    require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'find configuration' })

vim.keymap.set('n', '<leader>fh', function()
    require('fzf-lua').helptags()
end, { desc = 'search for help' })

vim.keymap.set('n', '<leader>fk', function()
    require('fzf-lua').keymaps()
end, { desc = 'search keymaps' })

vim.keymap.set('n', '<leader>fb', function()
    require('fzf-lua').builtin()
end, { desc = 'search builtin fzf' })

vim.keymap.set('n', '<leader>fw', function()
    require('fzf-lua').grep_cword()
end, { desc = 'find current word' })

vim.keymap.set('n', '<leader>fW', function()
    require('fzf-lua').grep_cWORD()
end, { desc = 'find current WORD' })

vim.keymap.set('n', '<leader>fd', function()
    require('fzf-lua').diagnostics_document()
end, {
    desc = 'find diagnostics',
})

vim.keymap.set('n', '<leader>fr', function()
    require('fzf-lua').resume()
end, {
    desc = 'find resume',
})

vim.keymap.set('n', '<leader>fo', function()
    require('fzf-lua').oldfiles()
end, { desc = 'find old files' })

vim.keymap.set('n', '<leader><leader>', function()
    require('fzf-lua').buffers()
end, { desc = 'find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
    require('fzf-lua').lgrep_curbuf()
end, { desc = 'live grep buffer' })
