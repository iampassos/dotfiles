return {
  "junegunn/fzf.vim",
  dependencies = {
    { "junegunn/fzf", build = "./install --bin" },
  },
  config = function()
    vim.keymap.set("n", "<leader>ff", "<cmd>Files<CR>")
    vim.keymap.set("n", "<leader>fg", "<cmd>GFiles<CR>")
    vim.keymap.set("n", "<leader>fb", "<cmd>Buffers<CR>")
  end,
}
