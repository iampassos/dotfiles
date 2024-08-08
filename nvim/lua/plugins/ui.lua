return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({})

      vim.cmd.colorscheme("ayu")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local theme = require("lualine.themes.auto")

      theme.normal.c.bg = nil
      theme.inactive.c.bg = nil

      require("lualine").setup({
        options = {
          theme = theme,
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "diagnostics" },
          lualine_c = { "%=", { "filename", file_status = true } },
          lualine_x = {},
          lualine_y = { "branch" },
          lualine_z = { "location" },
        },
        extensions = { "neo-tree" },
      })
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
