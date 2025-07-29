-- Enable lsp
vim.lsp.enable({ 'lua-ls' })

-- Configuring some options
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

-- Setup language servers.
-- Detup blink-cmp
local blink = function(capabilities)
  return require('blink.cmp').get_lsp_capabilities(capabilities)
end

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

-- Disable defaults
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- Unset 'formatexpr'
    vim.bo[args.buf].formatexpr = nil
    -- Unset 'omnifunc'
    vim.bo[args.buf].omnifujc = nil
    -- Unmap K
    vim.keymap.del('n', 'K', { buffer = args.buf })

    -- Disable document colors
    vim.lsp.buf.document_color.enable(false, args.buf)
  end,
})
