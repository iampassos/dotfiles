return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",
  },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "sql",
      callback = function()
        vim.api.nvim_set_keymap(
          "n",
          "<leader>e",
          ":normal! V<CR><Plug>(DBUI_ExecuteQuery)",
          { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
          "v",
          "<leader>e",
          "<Plug>(DBUI_ExecuteQuery)",
          { noremap = true, silent = true }
        )
      end,
    })
  end,
}
