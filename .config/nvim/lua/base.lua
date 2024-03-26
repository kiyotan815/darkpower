local set = vim.opt
local cmd = vim.cmd
local o = vim.o
local map = vim.keymap.set

-- Mappings
map('n', '<Space>', '')
vim.g.mapleader = ' '

map( 'i', 'jj', '<ESC>')

-- keybinding
map( 'n', ':', ';')
map( 'n', ';', ':')
map( 'n', '<ESC><ESC>', ':noh<CR>')
map( 'n', 'j', 'gj')
map( 'n', 'k', 'gk')
map( 'n', 'gj', 'j')
map( 'n', 'gk', 'k')
map( 'n', 'gk', 'k')
map( 'n', 'gk', 'k')
map( 'n', '<leader>w', ':w<CR>')
map( 'n', '<leader>q', ':q!<CR>')

-- split
map( 'n', 'ss', '<C-w>s')
map( 'n', 'sv', '<C-w>v')
map( 'n', 'sj', '<C-w>j')
map( 'n', 'sk', '<C-w>k')
map( 'n', 'sl', '<C-w>l')
map( 'n', 'sh', '<C-w>h')
map( 'n', 'sJ', '<C-w>J')
map( 'n', 'sK', '<C-w>K')
map( 'n', 'sL', '<C-w>L')
map( 'n', 'sH', '<C-w>H')

-- Some basic opt
set.encoding = "utf-8"
set.clipboard = 'unnamedplus'
set.smarttab = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.smartindent = true
set.number = true
set.virtualedit = 'onemore'
o.termguicolors = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.laststatus = 2
set.hlsearch = true
set.completeopt = { "menuone", "preview" }
