return
{
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to VSCode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "enter",
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            -- ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            ["<C-k>"] = { "show", "show_documentation", "hide_documentation" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
        completion = {
            -- The keyword should only match against the text before
            keyword = { range = "prefix" },
            menu = {
                -- Use treesitter to highlight the label text for the given list of sources
                draw = {
                    treesitter = { "lsp" },
                    columns = { { "label", "label_description", gap = 1 }, { "kind" } },
                },
            },
            -- Show completions after typing a trigger character, defined by the source
            trigger = { show_on_trigger_character = true },
            documentation = {
                -- Show documentation automatically
                auto_show = false,
                window = {
                    min_width = 10,
                    max_width = 80,
                    max_height = 20,
                    border = nil, -- Defaults to `vim.o.winborder` on nvim 0.11+ or 'padded' when not defined/<=0.10
                    winblend = 0,
                    winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                    -- Note that the gutter will be disabled when border ~= 'none'
                    scrollbar = true,
                    -- Which directions to show the documentation window,
                    -- for each of the possible menu window directions,
                    -- falling back to the next direction when there's not enough space
                    direction_priority = {
                        menu_north = { 'e', 'w', 'n', 's' },
                        menu_south = { 'e', 'w', 's', 'n' },
                    },
                },
            },
        },

        -- Signature help when tying
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}
