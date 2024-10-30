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
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

      require("nvim-autopairs").setup()
    end,
  },
  {
    "aurum77/live-server.nvim",
    config = function()
      local status_ok, live_server = pcall(require, "live_server")

      if not status_ok then
        return
      end

      live_server.setup({
        port = 8080,
        browser_command = "",
        quiet = false,
        no_css_inject = false,
        install_path = vim.fn.stdpath("config") .. "/live-server/",
      })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup()

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    end,
  },
}
