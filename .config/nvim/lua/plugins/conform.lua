return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters = {
        clang_format = {
          prepend_args = {
            "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}",
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>f", function()
      conform.format()
    end, {})

    -- This is for typescript
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
}
