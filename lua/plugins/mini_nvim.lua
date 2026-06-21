-- easy
local map = vim.keymap.set

vim.pack.add {
    { src = 'https://github.com/nvim-mini/mini.ai' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.surround' },
    { src = 'https://github.com/nvim-mini/mini.files' },
    -- { src = 'https://github.com/nvim-mini/mini.cmdline' },
    -- { src = 'https://github.com/nvim-mini/mini.notify' },
}

-- mini.ai
local _ = require('mini.ai').setup {}

-- mini.files settings
local _ = require('mini.files').setup {
    options = {
        permanent_delete = true,
        use_as_default_explorer = true,
        lsp_timeout = 1000,
    },
}

local mini_files = require 'mini.files'

map('n', '<leader>e', function()
    mini_files.open(nil, false)
end, { desc = 'open mini.files' })

map('n', '<leader>Er', function()
    if not mini_files.close() then
        mini_files.open()
    end
end, { desc = 'mini open last state' })

map('n', '<leader>Ee', function()
    local file = vim.api.nvim_buf_get_name(0)
    mini_files.open(file)
end, { noremap = true, silent = true, desc = 'mini open parent' })
