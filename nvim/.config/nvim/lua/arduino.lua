-- git clone https://github.com/yuukiflow/Arduino-Nvim.git ~/.dotfiles/nvim/.config/nvim/lua/Arduino-Nvim
-- Needs arduino-cli

require("Arduino-Nvim.lsp").setup()

vim.api.nvim_create_autocmd("FileType", {
  pattern = "arduino",
  callback = function()
    require("Arduino-Nvim")
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
  end,
})
