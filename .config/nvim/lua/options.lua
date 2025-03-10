vim.g.mapleader = " "
vim.opt.swapfile = false
vim.opt.termguicolors = true

vim.opt.smartindent = true

vim.opt.inccommand = "split"
vim.opt.smartcase = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.o.laststatus = 3
vim.o.statusline = "%f %m %{FugitiveStatusline()} %= %l:%L %y"

vim.opt.clipboard = "unnamedplus"
