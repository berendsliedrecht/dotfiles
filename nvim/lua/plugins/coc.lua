require("utils")

nmap("K", ":call CocAction('doHover')<CR>")
lnmap("e", "<Plug>(coc-codeaction-selected)w")
lnmap("r", ":call CocActionAsync('rename')<CR>")
nmap("gd", ":call CocAction('jumpDefinition')<CR>")
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
