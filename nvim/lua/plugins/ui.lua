return {
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("vague")

      local c = require('vague.colors')

      vim.cmd("highlight GitSignsChange guifg=" .. c.hint)
      vim.cmd("highlight GitSignsChangeLn guifg=" .. c.hint)
      vim.cmd("highlight GitSignsChangeNr guifg=" .. c.hint)
    end
  },
  {
    "typicode/bg.nvim", lazy = false
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local c = require('vague.colors')

      require("lualine").setup({
        options = {
          theme = {
            normal = { a = { fg = c.string } },
            insert = { a = { fg = c.plus } },
            visual = { a = { fg = c.error } },
            command = { a = { fg = c.hint } },
          },
          icons_enabled = true,
          component_separators = { left = '', right = '', },
          section_separators = { left = '', right = '', },
        },
        sections = {
          lualine_a = { { 'mode' } },
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
    'mawkler/modicator.nvim',
    dependencies = { "vague2k/vague.nvim" },
    opts = {
      integration = {
        lualine = {
          highlight = "fg"
        }
      }
    }
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[                                           ███                 ]],
        [[                                          ░░░                  ]],
        [[ ████████    ██████   ██████  █████ █████ ████  █████████████  ]],
        [[░░███░░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ]],
        [[ ░███ ░███ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ]],
        [[ ░███ ░███ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ]],
        [[ ████ █████░░██████ ░░██████   ░░█████    █████ █████░███ █████]],
        [[░░░░ ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
        [[                                                               ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰮗  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR>"),
        dashboard.button("q", "󰗼  Quit NVIM", ":qa<CR>"),
      }

      local v = vim.version()

      local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch

      dashboard.section.footer.val = version

      alpha.setup(dashboard.opts)
    end,
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
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local todo_comments = require("todo-comments")

      local c = require('vague.colors')

      todo_comments.setup({
        signs = true,
        keywords = {
          IDEA = { icon = "💡", color = "idea", alt = { "IDEAS" } }
        },
        colors = {
          error = { c.error },
          warning = { c.warning },
          info = { c.hint },
          hint = { c.plus },
          idea = { c.delta },
          default = { c.hint },
        },
      })

      vim.keymap.set("n", "[]t", "<cmd>TodoTelescope<CR>", {})
    end,
  }
}
