return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")

    oil.setup({
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-p>"] = false,
      },
    })

    vim.keymap.set("n", "<space><TAB>", "<CMD>Oil<CR>")
    vim.keymap.set("n", "<space>p", oil.open_preview)
  end,
}
