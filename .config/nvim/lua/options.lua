vim.g.mapleader = " "
vim.g.colorscheme = "default"

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.swapfile = false
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
vim.opt.clipboard = "unnamedplus"

vim.o.laststatus = 3
vim.o.statusline = "%f %m %{FugitiveStatusline()} %= %l:%L %y"
