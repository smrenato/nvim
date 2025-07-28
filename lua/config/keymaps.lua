vim.keymap.set('n', '-', '<CMD>Oil --float <CR>', { desc = 'Open parent directory' })

vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd('noh')
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })
