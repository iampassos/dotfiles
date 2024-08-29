return {
  "NelsonTLima/vim-portugol-highlight",
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "c", "typescript", "javascript" },
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = { "portugol" } },
      indent = { enable = true },
    })
  end,
}
