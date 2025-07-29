-- Open oil file explorer
vim.keymap.set('n', '-', '<CMD>Oil --float <CR>', { desc = 'Open parent directory' })

-- Clear hlsearch
vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })

-- Toggle inlay hints

vim.keymap.set('n', '<leader>ch', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle inlay hints' })

-- lsp keymap'
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, { desc = 'lsp code actions' })
