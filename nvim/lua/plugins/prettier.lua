require("utils")

vim.g["prettier#autoformat"] = 0
vim.g["prettier#autoformat_require_pragma"] = 0
vim.g["prettier#quickfix_enabled"] = 0
vim.g["prettier#exec_cmd_async"] = 1

lnmap("[", ":PrettierAsync<CR>")
lnmap("]", ":EslintFixAll<CR>")
