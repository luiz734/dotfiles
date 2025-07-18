return {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        local theme = require 'lualine.themes.nightfly'
        theme.normal.c.bg = 'none'

        local macro_group = vim.api.nvim_create_augroup("MacroStatusHighlight", { clear = true })
        vim.api.nvim_create_autocmd({ "ColorScheme" }, {
            pattern = "*",
            group = macro_group,
            callback = function()
                vim.api.nvim_set_hl(0, "MacroStatus", { foreground = "#ffffff", background = "#ff0000", bold = true })
            end
        })

        local function macro_status()
            local reg = vim.fn.reg_recording()
            if reg == "" then return "" end -- not recording
            return "%#MacroStatus#REC@" .. reg
        end

        require('lualine').setup {
            options = {
                -- icons_enabled = true,
                theme = theme,
                -- theme = "auto",
                -- component_separators = { left = '', right = '' },
                component_separators = '',
                -- section_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                -- lualine_a = { 'mode', separator = { left = '' } },
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { macro_status, 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
