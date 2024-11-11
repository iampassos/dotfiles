return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 1000,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
          { name = "nvim_lsp_signature_help" },
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select,
          }),
          ["<C-p>"] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select,
          }),
          ["<C-y>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        formatting = {
          format = require("lspkind").cmp_format({
            before = function(_, vim_item)
              vim_item.menu = ""
              vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
              return vim_item
            end,
            ellipsis_char = "...",
          }),
        },
      })
    end,
  },
}
