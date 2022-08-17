require("utils")

-- unmap
unmap("q:")
unmap("Q")

-- Remap move window keys
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Quit all
nmap("qa", ":qall<CR>")

-- quit current buffer
lnmap("q", ":bd<CR>")

-- Goto terminal mode
lnmap("t", ":vs | term<CR>")

-- Goto normal mode in terminal
tmap("<ESC>", "<C-\\><C-n>")

-- LSP utils
-- TODO: no clue why we cant use lnmap here
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>D', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>w', vim.diagnostic.setloclist, opts)
