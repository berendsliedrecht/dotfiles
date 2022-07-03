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
		width = 25,
		signcolumn = "yes",
	},
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_opened_files = "icon",
    icons = {
      glyphs = {
        git = {
          untracked = "U",
        },
      },
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      },
    },
  }
})
