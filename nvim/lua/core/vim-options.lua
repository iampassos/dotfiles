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

-- Clipboard
vim.opt.clipboard:append("unnamed,unnamedplus")

if vim.fn.has("wsl") == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("Yank", { clear = true }),

    callback = function()
      vim.fn.system("clip.exe", vim.fn.getreg("\""))
    end,
  })
end
