-- git clone https://github.com/yuukiflow/Arduino-Nvim.git ~/.dotfiles/nvim/.config/nvim/lua/Arduino-Nvim
-- package.path = package.path .. ";/home/edin/.luarocks/share/lua/5.4/?.lua;/home/edin/.luarocks/share/lua/5.4/?/init.lua"
-- Needs arduino-cli

require("Arduino-Nvim.lsp").setup()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "arduino",
  callback = function()
    require("Arduino-Nvim")
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
  end,
})
