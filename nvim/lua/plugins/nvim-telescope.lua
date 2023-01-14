require("utils")

local telescope = require("telescope")

lnmap("<leader>", ":lua require('telescope.builtin').git_files(require('telescope.themes').get_ivy({}))<CR>")
lnmap("/", ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({}))<CR>")
lnmap("b", ":lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<CR>")

telescope.setup({
  pickers = {
    git_files = {
      show_untracked = true
    },
  },
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
