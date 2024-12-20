return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "gruvbox-material",
          "github_dark_default",
          "vscode",
          "gruvbuddy",
          "oxocarbon",
          "sobrio",
          "darkvoid",
          "rasmus",
          "accent",
          "meh",
        },
        livePreview = true,
      })
    end,
  },
  "sainnhe/gruvbox-material",
  "projekt0n/github-nvim-theme",
  "nyoom-engineering/oxocarbon.nvim",
  "elvessousa/sobrio",
  "darkvoid-theme/darkvoid.nvim",
  "Mofiqul/vscode.nvim",
  "tjdevries/colorbuddy.nvim",
  "kvrohit/rasmus.nvim",
  "Alligator/accent.vim",
  "davidosomething/vim-colors-meh",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "numToStr/Comment.nvim" },
}
