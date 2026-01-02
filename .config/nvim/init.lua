--
-- OPTIONS
--

vim.g.mapleader = " "

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.swapfile = false
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.laststatus = 3

--
-- KEYMAPS
--

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-n>", "<cmd>vsplit<CR>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-TAB>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")

vim.keymap.set("n", "<C-Up>", ":resize -5<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +5<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>")

--
-- MISC
--

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = { "*.*" },
  command = "mkview",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = { "*.*" },
  command = "silent! loadview",
})

--
-- DIAGNOSTICS
--

vim.diagnostic.config({
  signs = {
    text = { [vim.diagnostic.severity.ERROR] = ">>", ... },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
    },
  },
  virtual_text = false,
  virtual_lines = false,
  underline = false,
})

vim.keymap.set("n", "<leader>l", function()
  vim.diagnostic.config({
    virtual_text = not vim.diagnostic.config().virtual_text == true,
    underline = not vim.diagnostic.config().underline == true,
  })
end)

--
-- LSP
--

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason").setup()

local lsp_list = { "lua_ls", "rust_analyzer", "clangd", "pylsp", "stylua" }

require("mason-lspconfig").setup({
  ensure_installed = lsp_list,
})

vim.lsp.config("*", {})

vim.lsp.config("clangd", {
  setup = {
    filetypes = { "cpp", "c" },
    cmd = { "clangd", "--function-arg-placeholders=0" },
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
        extraArgs = { "--", "-W", "clippy" },
      },
    },
  },
})

vim.lsp.enable(lsp_list)

--
-- TREESITTER
--

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "rust",
    "c",
    "cpp",
    "typescript",
    "javascript",
    "python",
    "java",
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})

--
-- COMPLETION
--

vim.pack.add({
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = vim.version.range("^1"),
  },
  { src = "https://github.com/windwp/nvim-autopairs" },
})

require("nvim-autopairs").setup({ event = "InsertEnter", config = true })

require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "buffer", "snippets", "path" },
  },
  completion = { accept = { auto_brackets = { enabled = true } } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
  signature = { enabled = true },
})

--
-- FORMATTER
--

vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    rust = { "rustfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 500,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  conform.format()
end, {})

--
-- FZF
--

vim.pack.add({
  { src = "https://github.com/junegunn/fzf.vim" },
  {
    src = "https://github.com/junegunn/fzf",
    dir = "~/.fzf",
    build = "./install --all",
  },
})

vim.keymap.set("n", "<leader>ff", "<cmd>Files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>GFiles<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Buffers<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>Rg<CR>")

--
-- GIT
--

vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/tpope/vim-fugitive" },
})

require("gitsigns").setup()

vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>")

--
-- OIL
--

vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

local oil = require("oil")

oil.setup({
  columns = { "icon" },
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["<C-h>"] = false,
    ["<C-p>"] = false,
  },
})

vim.keymap.set("n", "<space><TAB>", "<CMD>Oil<CR>")
vim.keymap.set("n", "<space>p", oil.open_preview)

--
-- TMUX
--

vim.pack.add({
  {
    src = "https://github.com/christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
})

--
-- COLORSCHEME
--

vim.pack.add({ { src = "https://github.com/sainnhe/gruvbox-material" } })
vim.cmd.colorscheme("gruvbox-material")

--
-- OTHER
--

vim.opt.statusline = "%f %m %{FugitiveStatusline()} %= %l:%L %y"
