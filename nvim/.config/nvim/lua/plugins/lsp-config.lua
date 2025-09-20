return {
    {
        'mason-org/mason.nvim',
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = false,
            ensure_installed = { "lua_ls" }
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            -- vim.lsp.config.lua_ls.setup {}
        end
    },
}
