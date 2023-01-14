require("utils")

lnmap("o", ":NvimTreeToggle<CR>")

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
    adaptive_size = true,
    cursorline = false,
	},
  renderer = {
    icons = {
      show = {
        folder_arrow = false,
      },
    },
  },
})
