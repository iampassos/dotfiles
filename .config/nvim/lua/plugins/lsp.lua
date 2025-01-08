return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    },
    config = function()
      require("mason").setup()

      local lspconfig = require("lspconfig")

      local servers = {
        lua_ls = {
          setup = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                },
              },
            },
          },
        },
        clangd = {
          setup = {
            filetypes = { "cpp", "c" },
            cmd = { "clangd", "--function-arg-placeholders=0" },
          },
        },
        -- rust_analyzer = {},
        ["stylua"] = false,
      }

      local servers_to_install = {}

      for server, _ in pairs(servers) do
        table.insert(servers_to_install, server)
      end

      require("mason-tool-installer").setup({
        ensure_installed = servers_to_install,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for server, config in pairs(servers) do
        if config then
          lspconfig[config.lsp or server].setup(vim.tbl_deep_extend("force", {
            capabilities = capabilities,
          }, config.setup or {}))
        end
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, {})

      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = false,
      })

      vim.keymap.set("", "<leader>l", function()
        local config = vim.diagnostic.config() or {}
        if config.virtual_text then
          vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
        else
          vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
        end
      end)
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        settings = {
          complete_function_calls = true,
          expose_as_code_action = "all",
        },
      })
    end,
  },
}
