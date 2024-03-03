return
{
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            vim.cmd.colorscheme 'tokyonight'
        end,
    },
    {
        "doums/darcula",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'darcula'
            -- vim.api.nvim_set_hl(0, 'NoiceCursor', { link = 'Cursor' })
        end,
    }
}
