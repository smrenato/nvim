vim.pack.add {
    { src = 'https://github.com/nvim-mini/mini.ai' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.surround' },
    { src = 'https://github.com/nvim-mini/mini.files' },
    -- { src = 'https://github.com/nvim-mini/mini.cmdline' },
    -- { src = 'https://github.com/nvim-mini/mini.notify' },
}

-- mini-files settings
local map = vim.keymap.set
local mini_files = require 'mini.files'

map('n', '<leader>e', function()
    if not mini_files.close() then
        mini_files.open()
    end
end, { desc = 'open mini.files' })

map('n', '<leader>E', function()
    local file = vim.api.nvim_buf_get_name(0)
    mini_files.open(file)
end, { noremap = true, silent = true, desc = 'explorer open parent' })
