vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, ';', ':', {})
vim.keymap.set({ 'n', 'v' }, ':', ';', {})

vim.keymap.set({ 'n', }, '<Up>', ':<Up>', {})
vim.keymap.set({ 'n', }, '<Left>', ':messages<CR>', { silent = true })

-- yank
vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y', {})
vim.keymap.set({ 'v', 'n' }, '<leader>p', '"+p', {})

vim.opt.showmode = false 
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

require 'config.autocmd'
require 'config.lazy'
