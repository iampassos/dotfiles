vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = { "*.*" },
  command = "mkview",
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.*" },
  command = "silent! loadview",
})

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

vim.keymap.set("", "<leader>l", function()
  local vt = vim.diagnostic.config().virtual_text == true
  vim.diagnostic.config({
    virtual_text = not vt,
    virtual_lines = vt,
  })
end)
