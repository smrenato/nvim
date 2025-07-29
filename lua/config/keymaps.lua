-- Open oil file explorer
vim.keymap.set('n', '<leader>e', '<CMD>lua MiniFiles.open()<CR>', { desc = 'open file explorer' })

-- Clear hlsearch
vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  return '<esc>'
end, { expr = true, desc = 'escape and clear hlsearch' })

-- Toggle inlay hints

vim.keymap.set('n', '<leader>ch', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'toggle inlay hints' })

-- lsp keymap'

vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, { desc = 'lsp code actions' })

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({ max_width = 90, max_height = 50 })
end, { desc = 'buff hover' })

-- code format
vim.keymap.set('n', '<leader>cf', function()
  require('conform').format({
    lsp_format = 'fallback',
  })
end, { desc = 'format current file' })

-- better indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'save file' })

-- Buffers
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'prev buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'next buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'prev buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'next buffer' })

vim.keymap.set('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'switch to other buffer' })
vim.keymap.set('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'delete buffer and window' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'next search result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'next search result' })
vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'next search result' })
vim.keymap.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'prev search result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'prev search result' })
vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'prev search result' })

-- better up and down
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'up', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'up', expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'go to left window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'go to lower window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'go to upper window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'go to right window', remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'increase window width' })
