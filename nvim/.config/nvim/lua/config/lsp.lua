-- Remove Global Default Key mapping
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "gO")

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local keymap = vim.keymap
        local lsp = vim.lsp
        local bufopts = { noremap = true, silent = true }

        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
        keymap.set('n', '<leader>D', lsp.buf.type_definition, bufopts)
        keymap.set('n', '<leader>ca', lsp.buf.code_action, bufopts)
        keymap.set('n', '<leader>rn', lsp.buf.rename, bufopts)
        keymap.set('n', 'K', lsp.buf.hover, bufopts)
        keymap.set('n', 'gD', lsp.buf.declaration, bufopts)
        keymap.set('n', 'gd', lsp.buf.definition, bufopts)
        keymap.set('n', 'gi', lsp.buf.implementation, bufopts)
        keymap.set('n', 'gr', lsp.buf.references, bufopts)
        keymap.set('n', '<C-M-l>', function()
            vim.lsp.buf.format { async = true }
        end, bufopts)
    end,
})


vim.lsp.enable {
    "lua_ls",
    "gdscript"
}
