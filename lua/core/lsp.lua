-- Diagnostic Config
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_lines = { current_line = true },
  virtual_text = false,
  -- virtual_text = {
  --   source = 'if_many',
  --   spacing = 2,
  --   format = function(diagnostic)
  --     local diagnostic_message = {
  --       [vim.diagnostic.severity.ERROR] = diagnostic.message,
  --       [vim.diagnostic.severity.WARN] = diagnostic.message,
  --       [vim.diagnostic.severity.INFO] = diagnostic.message,
  --       [vim.diagnostic.severity.HINT] = diagnostic.message,
  --     }
  --     return diagnostic_message[diagnostic.severity]
  --   end,
  -- },
}

-- Better border on hover
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover {
    max_height = math.floor(vim.o.lines * 0.5),
    max_width = math.floor(vim.o.columns * 0.4),
  }
end

-- Better signature help
local signature_help = vim.lsp.buf.signature_help
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.signature_help = function()
  return signature_help {
    max_height = math.floor(vim.o.lines * 0.5),
    max_width = math.floor(vim.o.columns * 0.4),
  }
end


-- Setup language servers.
-- Setup blink-cmp
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
    vim.bo[args.buf].omnifunc = nil
  end,
})

-- Finally enable all lsp on nvim/lsp
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    local server_configs = vim.iter(vim.api.nvim_get_runtime_file('lsp/*.lua', true))
        :map(function(file)
          return vim.fn.fnamemodify(file, ':t:r')
        end)
        :totable()
    vim.lsp.enable(server_configs)
  end,
})
