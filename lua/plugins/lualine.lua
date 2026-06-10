-- Lua line
vim.pack.add {
    {
        src = 'https://github.com/nvim-lualine/lualine.nvim',
    },
    {
        src = 'https://github.com/nvim-tree/nvim-web-devicons',
    },
}

local lualine = require('lualine').setup {
    sections = {
        lualine_x = { 'lsp_status', 'encoding', 'fileformat', 'filetype' },
    },
}
