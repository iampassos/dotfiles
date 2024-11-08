-- Windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-n>", "<cmd>vsplit<CR>")

-- Tabs
vim.keymap.set("n", "te", "<cmd>:tabedit<CR>")
vim.keymap.set("n", "td", "<cmd>:tabclose<CR>")
vim.keymap.set("n", "tn", "<cmd>:tabn<CR>")
vim.keymap.set("n", "tp", "<cmd>:tabp<CR>")
vim.keymap.set("n", "tl", "<cmd>:tablast<CR>")
vim.keymap.set("n", "tf", "<cmd>:tabfirst<CR>")

-- Searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Buffers
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-TAB>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")

-- Diagnostics
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
