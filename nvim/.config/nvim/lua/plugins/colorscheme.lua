return
{
    -- Update current theme persistently
    -- Store current theme in nvim/.config/lua/cache/theme.lua
    {
        "zaldih/themery.nvim",
        config = function()
            -- Minimal config
            require("themery").setup({
                themes = {
                    "catppuccin",
                    "tokyonight-night",
                    "moonfly"
                },                                                      -- Your list of installed colorschemes
                themeConfigFile = "~/.config/nvim/lua/cache/theme.lua", -- Described below
                livePreview = true,                                     -- Apply theme while browsing. Default to true.
            })
        end
    },

    -- Colorschemes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require 'catppuccin'.setup({
                flavour = "latte"
            })
            -- vim.cmd.colorscheme 'catppuccin'
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- vim.cmd.colorscheme 'tokyonight-night'
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme 'darcula'
            -- vim.api.nvim_set_hl(0, 'NoiceCursor', { link = 'Cursor' })
        end,
    }
}
