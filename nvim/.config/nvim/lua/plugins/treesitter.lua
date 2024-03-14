return
{
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua" },
            highlight = { enabled = true },
            indent = { enabled = true }

        })

        -- vim.o.foldmethod = 'expr'
        -- vim.o.foldlevel = 20
        -- vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
    end
}
