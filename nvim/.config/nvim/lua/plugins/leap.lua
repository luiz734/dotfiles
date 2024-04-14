return {
    "ggandor/leap.nvim",
    config = function()
        require 'leap'.add_default_mappings()

        -- Works on slipts
        vim.keymap.set('n', 's', function()
            local focusable_windows_on_tabpage = vim.tbl_filter(
                function(win) return vim.api.nvim_win_get_config(win).focusable end,
                vim.api.nvim_tabpage_list_wins(0)
            )
            require 'leap'.leap({ target_windows = focusable_windows_on_tabpage })
        end)
    end
}
