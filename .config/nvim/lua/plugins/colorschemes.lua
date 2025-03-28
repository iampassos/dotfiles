return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "gruvbox-material",
          "github_dark_default",
          "ayu",
          "vscode",
          "gruvbuddy",
          "rasmus",
          "jb",
          "carbide",
        },
        livePreview = true,
      })
    end,
  },
  "nickkadutskyi/jb.nvim",
  "sainnhe/gruvbox-material",
  "projekt0n/github-nvim-theme",
  "ayu-theme/ayu-vim",
  "Mofiqul/vscode.nvim",
  "tjdevries/colorbuddy.nvim",
  "kvrohit/rasmus.nvim",
  "ferdinandrau/carbide.nvim",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "xiyaowong/transparent.nvim" },
  { "numToStr/Comment.nvim" },
}
