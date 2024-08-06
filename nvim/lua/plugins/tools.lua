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
          if vim.fn.expand('%:e') == 'ts' then
            vim.cmd 'TSToolsOrganizeImports sync'
            vim.cmd 'TSToolsAddMissingImports sync'
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
    "mfussenegger/nvim-lint",
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        pattern = { "*.js", "*.ts" },
        group = lint_augroup,
        callback = function()
          lint.try_lint()
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
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '┃' },
          topdelete    = { text = '┃' },
          changedelete = { text = '┃' },
          untracked    = { text = '┃' },
        },
      })
    end
  },
}
