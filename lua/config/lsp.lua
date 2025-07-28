-- Main lsp configurations
--
-- Diagnostic

vim.diagnostic.config({

  virtual_line = {
    current_line = true,
  },
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})

-- Disable lsp-defaults
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Unset 'formatexpr'
    vim.bo[args.buf].formatexpr = nil
    -- Unset 'omnifunc'
    vim.bo[args.buf].omnifunc = nil
    -- Unmap K
    -- vim.keymap.del('n', 'K', { buffer = args.buf })
  end,
})

-- If there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'gc', '<cmd>lua vim.lsp.buf.rename()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set(
      { 'n', 'x' },
      '<F3>',
      '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
      { buffer = event.buf, desc = 'unknown' }
    )
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', { buffer = event.buf, desc = 'unknown' })
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover({ max_width = 90, max_height = 50 })
    end, { buffer = event.buf, desc = 'unknown' })
  end,
})

-- This is copied straight from blink
-- https://cmp.saghen.dev/installation#merging-lsp-capabilities

local blink = function(capabilities)
  return require('blink.cmp').get_lsp_capabilities(capabilities)
end

-- Setup language servers.

vim.lsp.config('*', {
  capabilities = blink({
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  }),
  root_markers = { '.git' },
})

-- finally enable LSP's from <path>/nvim/lsp
vim.lsp.enable({ 'lua-ls', 'ruff', 'rust-analyzer' })
