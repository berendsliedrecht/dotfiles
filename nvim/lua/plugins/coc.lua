require("utils")

nmap("K", ":call CocAction('doHover')<CR>")
lnmap("e", ":CocAction<CR>")
lnmap("r", ":call CocActionAsync('rename')<CR>")
nmap("gd", ":call CocAction('jumpDefinition')<CR>")
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
