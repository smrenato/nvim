-- Diagnostic configuration.
vim.diagnostic.config({
    virtual_text = false,
    -- Disable signs in the gutter.
    signs = false,
})

-- Override the hover
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover({
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    })
end

-- Override the hover
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
    return hover({
        max_height = math.floor(vim.o.lines * 0.5),
        max_width = math.floor(vim.o.columns * 0.4),
    })
end

-- Set up LSP servers using blink.
-- NOTE: This command depends on blink
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
    once = true,
    callback = function()
        -- Extend neovim's client capabilities with the completion ones.
        vim.lsp.config('*', {
            capabilities = require('blink.cmp').get_lsp_capabilities(
                nil,
                true
            ),
        })

        local servers = vim.iter(
            vim.api.nvim_get_runtime_file('lsp/*.lua', true)
        )
            :map(function(file)
                return vim.fn.fnamemodify(file, ':t:r')
            end)
            :totable()
        vim.lsp.enable(servers)
    end,
})

-- HACK: Override buf_request to ignore notifications from LSP servers that don't implement a method.
local buf_request = vim.lsp.buf_request
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf_request = function(bufnr, method, params, handler)
    return buf_request(bufnr, method, params, handler, function() end)
end

