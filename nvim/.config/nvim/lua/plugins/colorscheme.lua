return
{
    -- Update current theme persistently
    -- Store current theme in nvim/.config/lua/cache/theme.lua
    -- {
    --     "zaldih/themery.nvim",
    --     lazy = false,
    --     config = function()
    --         require("themery").setup({
    --             themes = {
    --                 "catppuccin",
    --                 "tokyonight-night",
    --                 "moonfly",
    --                 "onedark"
    --             },                  -- Your list of installed colorschemes
    --             livePreview = true, -- Apply theme while browsing. Default to true.
    --         })
    --     end
    -- },
    --
    -- Colorschemes
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            -- require('onedark').load()
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin-mocha",
        priority = 1000,
        config = function()
            require 'catppuccin'.setup({
                custom_highlights = function(colors)
                    return {
                        Comment = {},
                    }
                end,
                flavour = "mocha",
                default_integrations = true,
            })
            vim.cmd.colorscheme 'catppuccin'
            vim.api.nvim_set_hl(0, '@lsp.type.comment', {})
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
