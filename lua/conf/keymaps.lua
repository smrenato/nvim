-- The majority keymaps are set using which-key plugin
-- helper function
local function map(mode, keys, func, opts)
    vim.keymap.set(mode, keys, func, opts)
end

-- Helper maps to lsp
map('n', 'gO', function()
    vim.lsp.buf.document_symbol()
end, { desc = 'code document symbols' })

map('n', 'gri', function()
    vim.lsp.buf.implementation()
end, { desc = 'code go to implementation' })
map('n', 'grn', function()
    vim.lsp.buf.rename()
end, { desc = 'code rename' })
map('n', 'grr', function()
    vim.lsp.buf.references()
end, { desc = 'code go to references' })

map('n', 'grt', function()
    vim.lsp.buf.type_definition()
end, { desc = 'code go to type definitions' })
map({ 'v', 'n' }, 'gra', function()
    vim.lsp.buf.code_action()
end, { desc = 'code actions' })

-- Clear hlsearch
map({ 'i', 'n', 's' }, '<esc>', function()
    vim.cmd('noh')
    return '<esc>'
end, { expr = true, desc = 'escape and clear hlsearch' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'prev buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'next buffer' })

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
