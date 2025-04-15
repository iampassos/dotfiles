return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "rafamadriz/friendly-snippets", enabled = false },
      { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
    },
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "buffer", "snippets", "path" },
        per_filetype = { sql = { "dadbod" } },
        providers = {
          dadbod = { module = "vim_dadbod_completion.blink" },
        },
      },
      completion = { accept = { auto_brackets = { enabled = true } } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
  },
}
