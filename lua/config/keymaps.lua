-- helper function
local function map(mode, keys, func, opts)
    vim.keymap.set(mode, keys, func, opts)
end

map('n', '<leader>l', '<CMD>Lazy home<CR>', { desc = 'Open lazy' })
map('n', '<leader>m', '<CMD>Mason<CR>', { desc = 'Open Mason' })

-- Open mini files
-- map('n', '<leader>e', function()
--     require('mini.files').open()
-- end, { desc = 'open file explorer' })

map('n', '<leader>e', function()
    require('oil').open_float()
end, { desc = 'open file explorer' })

-- Clear hlsearch
map({ 'i', 'n', 's' }, '<esc>', function()
    vim.cmd('noh')
    return '<esc>'
end, { expr = true, desc = 'escape and clear hlsearch' })

-- Toggle diagnostic
map('n', '<leader>cd', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })

-- Open diagnostics float
map('n', '<leader>cD', function()
    vim.diagnostic.open_float()
end, { desc = 'Open diagnostics float' })

-- Toggle inlay hints
map('n', '<leader>ch', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'toggle inlay hints' })

-- lsp keymaps
map('n', 'gra', vim.lsp.buf.code_action, { desc = 'lsp code actions' })

map('n', 'K', function()
    vim.lsp.buf.hover({ max_width = 90, max_height = 50 })
end, { desc = 'buff hover' })

-- code format
map('n', '<leader>cf', function()
    require('conform').format({
        lsp_format = 'fallback',
    })
end, { desc = 'format current file' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'save file' })

-- Buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'prev buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'next buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'prev buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'next buffer' })

map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'switch to other buffer' })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'delete buffer and window' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map(
    'n',
    'n',
    "'Nn'[v:searchforward].'zv'",
    { expr = true, desc = 'next search result' }
)
map(
    'x',
    'n',
    "'Nn'[v:searchforward]",
    { expr = true, desc = 'next search result' }
)
map(
    'o',
    'n',
    "'Nn'[v:searchforward]",
    { expr = true, desc = 'next search result' }
)
map(
    'n',
    'N',
    "'nN'[v:searchforward].'zv'",
    { expr = true, desc = 'prev search result' }
)
map(
    'x',
    'N',
    "'nN'[v:searchforward]",
    { expr = true, desc = 'prev search result' }
)
map(
    'o',
    'N',
    "'nN'[v:searchforward]",
    { expr = true, desc = 'prev search result' }
)

-- better up and down
map(
    { 'n', 'x' },
    'j',
    "v:count == 0 ? 'gj' : 'j'",
    { desc = 'down', expr = true, silent = true }
)
map(
    { 'n', 'x' },
    '<Down>',
    "v:count == 0 ? 'gj' : 'j'",
    { desc = 'down', expr = true, silent = true }
)
map(
    { 'n', 'x' },
    'k',
    "v:count == 0 ? 'gk' : 'k'",
    { desc = 'up', expr = true, silent = true }
)
map(
    { 'n', 'x' },
    '<Up>',
    "v:count == 0 ? 'gk' : 'k'",
    { desc = 'up', expr = true, silent = true }
)

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'go to left window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'go to lower window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'go to upper window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'go to right window', remap = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'decrease window height' })
map(
    'n',
    '<C-Left>',
    '<cmd>vertical resize -2<cr>',
    { desc = 'decrease window width' }
)
map(
    'n',
    '<C-Right>',
    '<cmd>vertical resize +2<cr>',
    { desc = 'increase window width' }
)
