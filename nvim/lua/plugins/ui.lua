return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("solarized-osaka").setup({
        transparent = false,
      })

      vim.cmd.colorscheme("solarized-osaka")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local theme = require 'lualine.themes.solarized_dark'

      theme.normal.c.bg = nil
      theme.normal.a.fg = theme.normal.a.bg
      theme.normal.b.fg = theme.normal.b.bg
      theme.insert.a.fg = theme.insert.a.bg
      theme.visual.a.fg = theme.visual.a.bg
      theme.replace.a.fg = theme.replace.a.bg
      theme.normal.a.bg = nil
      theme.normal.b.bg = nil
      theme.insert.a.bg = nil
      theme.visual.a.bg = nil
      theme.replace.a.bg = nil
      theme.inactive.c.bg = nil

      require("lualine").setup({
        options = {
          theme = theme,
          icons_enabled = true,
          component_separators = { left = '', right = '', },
          section_separators = { left = '', right = '', },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'diagnostics' },
          lualine_c = { '%=', { 'filename', file_status = true } },
          lualine_x = {},
          lualine_y = { 'branch' },
          lualine_z = { 'location' }
        },
        extensions = { 'neo-tree' }
      })
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({ filesystem = { filtered_items = { visible = true } } })

      vim.keymap.set("n", "<leader><Tab>", "<cmd>Neotree toggle reveal left<CR>", { silent = true })
    end,
  },
  { "numToStr/Comment.nvim" },
}
