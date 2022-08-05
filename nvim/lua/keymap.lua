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

-- Goyo focus mode
lnmap("g", ":Goyo<CR>")

-- Open projects finder
lnmap("p", ":Telescope projects<CR>")

-- Goto terminal mode
lnmap("t", ":vs | term<CR>")

-- Goto normal mode in terminal
tmap("<ESC>", "<C-\\><C-n>")
