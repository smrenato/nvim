-- Extras
local function restart_lsp(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    for _, client in ipairs(clients) do
        vim.lsp.Client:stop(client.id)
    end

    vim.defer_fn(function()
        vim.cmd('edit')
    end, 100)
end

vim.api.nvim_create_user_command('LspRestart', function()
    restart_lsp()
end, { desc = 'Restart lsp' })
