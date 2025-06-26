-- =========================================================================
-- MINIMAL CONFI FOR NVIM. IT DOENS'T LOAD ANY PLUGINS.
-- =========================================================================

-- KEYMAPS
vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, ';', ':', {})
vim.keymap.set({ 'n', 'v' }, ':', ';', {})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n' }, '<c-s>', function() vim.cmd ':w' end, { silent = true })
vim.keymap.set({ 'n' }, '<C-o>', '<C-o>zz', { silent = true })
-- arrow remaps
vim.keymap.set({ 'n', }, '<Up>', ':<Up>', {})
vim.keymap.set({ 'n', }, '<Left>', ':messages<CR>', { silent = true })
-- yank
vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p', {})


-- OPTIONS
vim.opt.showmode = false -- equivalent to set noshowmode
vim.opt.termguicolors = true
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.tabstop = 2
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.o.scrolloff = 10
-- fix spectre position
vim.o.splitright = true

-- Remember last position on file
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Blink when yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
