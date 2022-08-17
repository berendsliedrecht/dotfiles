-- Utility functions--

function map(mode, shortcut, command)
	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command)
end

function unmap(shortcut)
	map("n", shortcut, "<nop>")
end

function vmap(shortcut, command)
	map("v", shortcut, command)
end

function imap(shortcut, command)
	map("i", shortcut, command)
end

function tmap(shortcut, command)
	map("t", shortcut, command)
end

function lnmap(shortcut, command)
	shortcut = "<leader>" .. shortcut
	map("n", shortcut, command)
end

function ltmap(shortcut, command)
	shortcut = "<leader>" .. shortcut
	map("t", shortcut, command)
end

function vvar(var, value)
	vim.api.nvim_set_var(var, value)
end

function opt(key, value)
	vim.o[key] = value
end

function aopt(key, value)
	vim.o[key] = vim.o[key] .. value
end
