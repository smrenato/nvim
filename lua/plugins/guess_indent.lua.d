vim.pack.add({
    { src = gh('NMAC427/guess-indent.nvim') },
})

local indent = require('guess-indent').setup({})
