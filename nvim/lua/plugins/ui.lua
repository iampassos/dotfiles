return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })

      vim.cmd.colorscheme("carbonfox")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local theme = require("lualine.themes.auto")

      for _, section in pairs(theme) do
        for sub, style in pairs(section) do
          if sub ~= "a" then
            style.bg = nil
          end
        end
      end

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
        extensions = { "oil", "trouble", "lazy", "fugitive" },
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
