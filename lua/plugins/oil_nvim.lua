-- Oil

vim.pack.add({
    {
        src = gh('stevearc/oil.nvim'),
        name = 'oil',
    },
    {
        src = gh('vim-tree/nvim-web-devicons'),
        name = 'devicons',
    },
})

oil = require('oil').setup({

    view_options = {
        show_hidden = true,
        -- ensure numbers off in the oil buffer
        relativenumber = false,
        number = false,
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
