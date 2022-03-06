require("utils")

lnmap("o", ":NvimTreeToggle<CR>")

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_width_allow_resize = 1

vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}

vim.g.nvim_tree_icons = {
	git = {
		untracked = "U",
	},
}

require("nvim-tree").setup({
	filters = {
		dotfiles = true,
		custom = { ".git", "node_modules", ".cache", ".bin" },
	},
	git = {
		enable = false,
		ignore = true,
	},
	view = {
		width = 25,
		auto_resize = true,
		signcolumn = "yes",
	},
})
