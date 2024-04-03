vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, ';', ':', {})
vim.keymap.set({ 'n', 'v' }, ':', ';', {})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n' }, '<c-s>', function() vim.cmd ':w' end, { silent = true })
vim.keymap.set('n', '<C-0>', '<C-w><C-w>', { desc = "Next window" })

-- arrow remaps
-- vim.keymap.set({ 'n', }, '<C-q>', ':q<CR>', { silent = true })
vim.keymap.set({ 'n', }, '<Up>', ':<Up>', {})
vim.keymap.set({ 'n', }, '<Left>', ':messages<CR>', { silent = true })


vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p', {})

vim.keymap.set({ 'n' }, '<Tab><Tab>', ':w<CR>', { silent = true })

vim.keymap.set({ 'n' }, '<C-o>', '<C-o>zz', { silent = true })



-- vim.opt.clipboard = 'unnamedplus'
vim.opt.showmode = false -- equivalent to set noshowmode
vim.opt.termguicolors = true
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.mouse = ''
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = 'yes'


-- remember last position on file
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

-- open telescope when open obsidian/wiki dir
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function(args)
        local home = os.getenv("HOME")
        if vim.fn.getcwd() == home .. "/Drive/obsidian/Wiki" then
            -- require('telescope.builtin').live_grep()
            -- vim.api.nvim_echo({ { home, 'WarningMsg' } }, true, {})
        end
    end,
})

-- remember folding
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    pattern = { "*.*" },
    desc = "save view (folds), when closing file",
    command = "mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "*.*" },
    desc = "load view (folds), when opening file",
    command = "silent! loadview"
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("lazy").setup("plugins", opts)

vim.keymap.set('n', '<leader>]', ':bn<CR>', { desc = "Buffer next" })
vim.keymap.set('n', '<leader>[', ':bp<CR>', { desc = "Buffer prev" })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { desc = "Buffer close" })
vim.keymap.set('n', '<leader>ww', '<C-w><C-w>', { noremap = true, desc = "Next window" })
vim.keymap.set('n', '<leader>wv', function()
    vim.cmd [[vsplit | wincmd l]]
    -- vim.cmd [[wincmd l<CR>]]
end, { noremap = true, desc = "Window vertical split" })
vim.keymap.set('n', '<leader>ws', ':split<CR>', { noremap = true, desc = "Window split" })
vim.keymap.set('n', '<leader>wc', ':close<CR>', { noremap = true, desc = "Window close" })
vim.keymap.set('n', '<leader>wo', ':only<CR>', { noremap = true, desc = "Window close others" })
vim.keymap.set('n', '<leader>wl', ':wincmd l<CR>', { noremap = true, desc = "Window left" })
vim.keymap.set('n', '<leader>wh', ':wincmd r<CR>', { noremap = true, desc = "Window right" })
vim.keymap.set('n', '<leader>w=', ':wincmd =<CR>', { noremap = true, desc = "Window match width" })
vim.keymap.set('n', '<leader>w-', ':tab split<CR>', { noremap = true, desc = "Open window in new tab" })
vim.keymap.set('n', '<leader>w0', ':tabc<CR>', { noremap = true, desc = "Close tab" })
