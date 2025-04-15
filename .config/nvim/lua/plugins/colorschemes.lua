return {
  {
    "zaldih/themery.nvim",
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function(args)
          vim.schedule(function()
            if args.match == "sonokai" then
              vim.o.termguicolors = false
            else
              vim.o.termguicolors = true
            end
          end)
        end,
      })

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
          "sonokai",
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
  "sainnhe/sonokai",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "xiyaowong/transparent.nvim" },
  { "numToStr/Comment.nvim" },
}
