-- change default behaviour
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

-- quickfix
vim.keymap.set('n', '<c-]>', ':cn<CR>', { desc = "Quick fix next", silent = true })
vim.keymap.set('n', '<c-[>', ':cp<CR>', { desc = "Quick fix prev", silent = true })
-- cdo %s/foo/bar/gc

-- window related
vim.keymap.set('n', '<leader>ww', '<C-w><C-w>', { noremap = true, desc = "Next window" })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>:wincmd l<CR>', { noremap = true, desc = "Window split" })
vim.keymap.set('n', '<leader>ws', ':split<CR>', { noremap = true, desc = "Window split" })
vim.keymap.set('n', '<leader>q', ':close<CR>', { noremap = true, desc = "Window close" })
vim.keymap.set('n', '<leader>wo', ':only<CR>', { noremap = true, desc = "Window close others" })
vim.keymap.set('n', '<leader>w=', ':wincmd =<CR>', { noremap = true, desc = "Window match width" })
vim.keymap.set('n', '<leader>w-', ':tab split<CR>', { noremap = true, desc = "Open window in new tab" })
vim.keymap.set('n', '<leader>w0', ':tabc<CR>', { noremap = true, desc = "Close tab" })
vim.keymap.set('n', '<leader>wH', '<c-w>H', { noremap = true, silent = true, desc = "Move window left" })
vim.keymap.set('n', '<leader>wL', '<c-w>L', { noremap = true, silent = true, desc = "Move window right" })


-- vim.opt.clipboard = 'unnamedplus'
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
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.timeoutlen = 500
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.o.scrolloff = 10
-- fix spectre position
vim.o.splitright = true


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

-- blink when yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- open certain type os files on a vertical split
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function(event)
        if vim.bo[event.buf].filetype == 'help' then
            vim.cmd("wincmd L | wincmd =")
        elseif vim.bo[event.buf].filetype == 'qf' then
            vim.cmd("wincmd L | vert resize 80")
        end
    end,
})


-- lazy setup
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

-- setup themery
-- create the config file used to store the current theme
local success, _ = pcall(function()
    require('cache.theme')
end)
if not success then
    local user = os.getenv("USER")
    local theme_config_dir = '/home/' .. user .. '/.config/nvim/lua/cache'
    local theme_config_file = theme_config_dir .. '/theme.lua'
    os.execute("mkdir " .. theme_config_dir)
    local f = io.open(theme_config_file, "w")
    if f ~= nil then
        f:write([[-- Themery block
  -- This block will be replaced by Themery.
-- end themery block]])
        f:close()
    else
        error([[Can't create file for Themery. Create it manually at
]] .. theme_config_file)
    end
end
