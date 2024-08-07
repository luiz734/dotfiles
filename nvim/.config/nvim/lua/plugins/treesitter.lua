return
{
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "markdown", "markdown_inline", "python", "gdscript" },
            auto_install = true,
            highlight = { enabled = true },
            indent = { enabled = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = false, -- set to `false` to disable one of the mappings
                    node_incremental = "v",
                    node_decremental = "V",
                    scope_incremental = false,
                },
            },
        })

        -- vim.o.foldmethod = 'expr'
        -- vim.o.foldlevel = 20
        -- vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
    end
}
