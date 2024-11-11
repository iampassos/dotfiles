return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "gruvbox-material",
          "kanagawa-wave",
          "kanagawa-dragon",
          "kanagawa-paper",
          "rose-pine",
          "no-clown-fiesta",
          "adwaita",
          "github_dark",
          "github_dark_default",
          "tokyonight-moon",
          "tokyonight-storm",
          "tokyonight-night",
          "catppuccin-latte",
          "catppuccin-frappe",
          "catppuccin-macchiato",
          "catppuccin-mocha",
          "material",
          "vscode",
          "yugen",
          "darkvoid",
        },
        livePreview = true,
      })
    end,
  },
  "rebelot/kanagawa.nvim",
  "sho-87/kanagawa-paper.nvim",
  "sainnhe/gruvbox-material",
  "rose-pine/neovim",
  "aktersnurra/no-clown-fiesta.nvim",
  "Mofiqul/adwaita.nvim",
  "projekt0n/github-nvim-theme",
  "folke/tokyonight.nvim",
  "catppuccin/nvim",
  "marko-cerovac/material.nvim",
  "Mofiqul/vscode.nvim",
  "bettervim/yugen.nvim",
  "Aliqyan-21/darkvoid.nvim",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "numToStr/Comment.nvim" },
}
