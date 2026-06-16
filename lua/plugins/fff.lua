vim.pack.add { 'https://github.com/dmtrKovalenko/fff.nvim' }

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
            if not ev.data.active then
                vim.cmd.packadd 'fff.nvim'
            end
            require('fff.download').download_or_build_binary()
        end
    end,
})

vim.api.nvim_create_user_command('FFFDownload', function(opts)
    require('fff.download').download_or_build_binary()
end, {})

vim.g.fff = {
    lazy_sync = true,
    -- debug = { enabled = true, show_scores = true },
    prompt_vim_mode = true,
}

local fff = require('fff').setup {
    prompt = ' ❯',
}

vim.keymap.set('n', 'ff', function()
    require('fff').find_files()
end, { desc = 'find files' })

vim.keymap.set('n', '<leader>fg', function()
    require('fff').live_grep()
end, { desc = 'live grep' })

vim.keymap.set('n', '<leader>fz', function()
    require('fff').live_grep { grep = { modes = { 'fuzzy', 'plain' } } }
end, { desc = 'live fffuzy grep' })

vim.keymap.set('n', '<leader>fc', function()
    require('fff').live_grep { query = vim.fn.expand '<cword>' }
end, { desc = 'search current word' })

vim.keymap.set('n', '<leader>ft', function()
    require('fff').live_grep { query = 'TODO' }
end, { desc = 'search todo comment' })
