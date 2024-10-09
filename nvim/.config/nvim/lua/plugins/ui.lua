return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "darker"

      require("material").setup({
        contrast = {
          sidebars = true,
          floating_windows = true,
          cursor_line = true,
          non_current_windows = true,
        },
        plugins = {
          "gitsigns",
          "nvim-cmp",
          "nvim-web-devicons",
          "telescope",
          "trouble",
        },
        disable = {
          colored_cursor = true,
          background = false,
        },
      })

      vim.cmd.colorscheme("material")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "numToStr/Comment.nvim" },
}
