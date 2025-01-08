return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "rust",
        "c",
        "cpp",
        "typescript",
        "javascript",
        "python",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
