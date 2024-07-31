return
{
    -- Update current theme persistently
    -- Store current theme in nvim/.config/lua/cache/theme.lua
    {
        "zaldih/themery.nvim",
        config = function()
            local user = os.getenv('USER')
            local theme_config_file = '/home/' .. user .. '/.config/nvim/lua/cache/theme.lua'
            -- Minimal config
            require("themery").setup({
                themes = {
                    "catppuccin",
                    "tokyonight-night",
                    "moonfly",
                    "onedark"
                },                                   -- Your list of installed colorschemes
                themeConfigFile = theme_config_file, -- Described below
                livePreview = true,                  -- Apply theme while browsing. Default to true.
            })
        end
    },

    -- Colorschemes
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            require('onedark').load()
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin-mocha",
        priority = 1000,
        config = function()
            require 'catppuccin'.setup({
                flavour = "mocha"
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
