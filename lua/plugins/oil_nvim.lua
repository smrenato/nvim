-- Oil file explorer
vim.pack.add({
    {
        src = 'https://github.com/stevearc/oil.nvim',
    },
    {
        src = 'https://github.com/nvim-tree/nvim-web-devicons',
    },
})

local oil = require('oil').setup({

    default_file_explorer = true,
    skip_confirm_for_simple_edits = false,
    columns = {
        'icon',
        -- 'permissions',
        -- 'size',
        -- "mtime",
    },

    view_options = {
        show_hidden = true,
    },
    float = {
        max_width = 0.60,
        max_height = 0.80,
        border = 'rounded',
    },
})
