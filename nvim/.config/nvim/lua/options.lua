-- Defaults
vim.language = "en_US"
vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.termguicolors = true

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Cursor & Lines
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"

-- Status Line
vim.o.laststatus = 3
vim.o.statusline = "%f %m %= %l:%L %y"

-- Clipboard
vim.opt.clipboard = "unnamedplus"
