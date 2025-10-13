return {
    'stevearc/oil.nvim',
    config = function()
        require("oil").setup({
            delete_to_trash = true,
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, bufnr)
                    local patterns_to_ignore = {
                        "%.gd%.uid$",
                    }

                    for _, pattern in ipairs(patterns_to_ignore) do
                        if name:match(pattern) then
                            return true
                        end
                    end

                    return false
                end,
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = false,
                ["<C-r>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
        })

        vim.keymap.set('n', '<leader>o', function()
            require("oil").open()
        end, { noremap = true, desc = "Open oil" })
    end
}
