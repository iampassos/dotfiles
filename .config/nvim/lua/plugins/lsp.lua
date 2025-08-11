return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      local lsp_list = { "lua_ls", "rust_analyzer", "clangd", "pylsp", "jdtls" }

      require("mason-lspconfig").setup({
        ensure_installed = lsp_list,
      })

      vim.lsp.config("*", {})

      vim.lsp.config("clangd", {
        setup = {
          filetypes = { "cpp", "c" },
          cmd = { "clangd", "--function-arg-placeholders=0" },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--", "-W", "clippy::pedantic" },
            },
          },
        },
      })

      vim.lsp.enable(lsp_list)
    end,
  },
}
