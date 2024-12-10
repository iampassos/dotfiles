return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "gruvbox-material",
          "github_dark",
          "github_dark_default",
          "tokyonight-moon",
          "tokyonight-storm",
          "tokyonight-night",
          "catppuccin-latte",
          "catppuccin-frappe",
          "catppuccin-macchiato",
          "catppuccin-mocha",
          "vscode",
          "gruvbuddy",
        },
        livePreview = true,
      })
    end,
  },
  "sainnhe/gruvbox-material",
  "projekt0n/github-nvim-theme",
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
  "Mofiqul/vscode.nvim",
  "tjdevries/colorbuddy.nvim",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "numToStr/Comment.nvim" },
}
