-- Oil file explorer
vim.pack.add({
    {
        src = gh('stevearc/oil.nvim'),
        name = 'oil',
    },
    {
        src = gh('nvim-tree/nvim-web-devicons'),
        name = 'devicons',
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
-- disable line numbers for oil.nvim buffers
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'oil',
    callback = function()
        vim.wo.number = false
        vim.wo.relativenumber = false
    end,
})
