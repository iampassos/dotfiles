return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          python = { "black" },
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
      })

      vim.keymap.set("n", "<leader>f", function()
        conform.format()
      end, {})

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          if vim.fn.expand("%:e") == "ts" then
            vim.cmd("TSToolsOrganizeImports sync")
            vim.cmd("TSToolsAddMissingImports sync")
          end

          conform.format({
            buf = args.buf,
            async = false,
          })
        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
      },
    },
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "┃" },
          topdelete = { text = "┃" },
          changedelete = { text = "┃" },
          untracked = { text = "┃" },
        },
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
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

      vim.keymap.set("n", "<space><TAB>", oil.toggle_float)
      vim.keymap.set("n", "<space>p", oil.open_preview)
    end,
  },
}
