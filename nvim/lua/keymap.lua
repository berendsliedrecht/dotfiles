require("utils")

-- Remap movement keys
nmap(";", "l")
nmap("l", "gk")
nmap("k", "gj")
nmap("j", "h")
vmap(";", "l")
vmap("l", "k")
vmap("k", "j")
vmap("j", "h")
nmap("<C-j>", "<C-w>h")

-- unmap
unmap("q:")
unmap("Q")

-- Remap move window keys
nmap("<C-j>", "<C-w>h")
nmap("<C-k>", "<C-w>j")
nmap("<C-l>", "<C-w>k")
nmap("<C-w>", "<C-w>l")

-- Quit all
nmap("qa", ":qall<CR>")

-- quit current buffer
lnmap("q", ":bd<CR>")
