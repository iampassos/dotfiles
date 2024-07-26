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

-- This is for wsl2
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = { "clip.exe" },
      ["*"] = { "clip.exe" },
    },
    paste = {
      ["+"] = {
        "/mnt/c/Windows/System32/WindowsPowerShell/v1.0///powershell.exe",
        "-c",
        '[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
      ["*"] = {
        "/mnt/c/Windows/System32/WindowsPowerShell/v1.0///powershell.exe",
        "-c",
        '[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
    },
    cache_enabled = false,
  }
end

-- Link NeoVim's clipboard with the computer's one
vim.opt.clipboard:append("unnamed,unnamedplus")
